import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:latest_movies_app/models/movie.dart';

class MoviesProv extends ChangeNotifier {
  final dio = Dio();

  final String image_url = "https://image.tmdb.org/t/p/w500";

  final String search_url =
      "https://api.themoviedb.org/3/search/movie?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&query=fight&page=1&include_adult=false";
  final String recommendation_url =
      "https://api.themoviedb.org/3/movie/550/recommendations?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=1";
  final String populars_url =
      "https://api.themoviedb.org/3/movie/popular?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=";
  final String upcoming =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=1";
  final String top_rated =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=1";

  final String latest =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=1";
  final String film_url =
      "https://api.themoviedb.org/3/movie/550?api_key=9240023865dd052e90b0564d9b5f6179";
  final String film_url1 = "https://api.themoviedb.org/3/movie/";

  final String film_url2 = "?api_key=9240023865dd052e90b0564d9b5f6179";

  final String trailer_key =
      "http://api.themoviedb.org/3/movie/550/videos?api_key=9240023865dd052e90b0564d9b5f6179";
  final String youtube_url = "https://www.youtube.com/watch?v=";

  final String cast_url_and_details =
      "https://api.themoviedb.org/3/movie/550?api_key=9240023865dd052e90b0564d9b5f6179&append_to_response=credits";
  final String cast_url2 =
      "https://api.themoviedb.org/3/movie/551/credits?api_key=9240023865dd052e90b0564d9b5f6179";

  List<Movie>? populars = [];

  Future<String> getPopulars(int pageNumber) async {
    Response<Map> response =
        await dio.get(populars_url + pageNumber.toString());
    List results = response.data!["results"];

    populars = results
        .map(
          (e) => Movie(
            e["id"],
            image_url + e["poster_path"],
            e["adult"],
            e["overview"],
            e["release_date"],
            e["genres_ids"],
            e["original_title"],
            e["original_language"],
            e["title"],
            image_url + e["backdrop_path"],
            e["popularity"],
            e["vote_count"],
            e["video"],
            e["vote_average"],
          ),
        )
        .toList();

    // print(populars);
    notifyListeners();
    return image_url + response.data!["results"][10]["backdrop_path"];
  }

  Future<Movie> getDetails(int id) async {
    String url = film_url1 + id.toString() + film_url2;
    // print(url);
    Response<Map> response = await dio.get(url);
    final data = response.data;
    // print("1");
    // print(data?["adult"]);
    // print("2");
    String? posterPath =
        data?["posterPath"] == null ? "" : image_url + data?["posterPath"];
    String? backdropPath =
        data?["backdropPath"] == null ? "" : image_url + data?["backdropPath"];

    return Movie(
      id,
      posterPath,
      data?["adult"],
      data?["overview"],
      data?["release_date"],
      data?["genres_ids"],
      data?["original_title"],
      data?["original_language"],
      data?["title"],
      backdropPath,
      data?["popularity"],
      data?["vote_count"],
      data?["video"],
      data?["vote_average"],
    );
  }
}
