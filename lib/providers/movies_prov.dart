import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:latest_movies_app/models/cast.dart';
import 'package:latest_movies_app/models/cast_detail.dart';
import 'package:latest_movies_app/models/movie.dart';
import '../models/functions_enum.dart';

class MoviesProv extends ChangeNotifier {
  final dio = Dio();

  final String image_url = "https://image.tmdb.org/t/p/w500";

  // final String search_url =
  //     "https://api.themoviedb.org/3/search/movie?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&query=fight&page=1&include_adult=false";
  final String recommendationUrl =
      "https://api.themoviedb.org/3/movie/550/recommendations?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=";
  final String popularsUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=";
  final String upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=";
  final String topRated =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=";

  final String latestUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=";
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
      "https://api.themoviedb.org/3/movie/550/credits?api_key=9240023865dd052e90b0564d9b5f6179";

  final String imageNotFoundUrl =
      "https://blog.hubspot.com/hubfs/Sales_Blog/famous-movie-quotes.jpg";

  final String reviewsUrl =
      "https://api.themoviedb.org/3/movie/550?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US";

  List<Cast>? casts = [];

  List<Movie>? populars = [];
  List<Movie>? recommendeds = [];
  List<Movie>? upcomings = [];
  List<Movie>? topRateds = [];
  List<Movie>? searchResults = [];
  List<Movie>? similarMovies = [];
  List<Movie>? latestMovies = [];

  int? totalRecommendedPages = 1;
  int? totalPopularPages = 1;
  int? totalUpcomingPages = 1;
  int? totalTopRatedPages = 1;
  int? totalSearchPages = 1;
  int? totalSimilarMoviePages = 1;
  int? totalLatestPages = 1;

  int currentRecommendedPages = 1;
  int currentPopularPages = 1;
  int currentUpcomingPages = 1;
  int currentTopRatedPages = 1;
  int currentSearchPages = 1;
  int currentSimilarMoviePages = 1;
  int currentLatestPages = 1;

  List<Movie> mapResultsToMovie(List results) {
    List<Movie> movies = results
        .map(
          (e) => Movie(
            e["id"],
            e["poster_path"] == null
                ? imageNotFoundUrl
                : image_url + e["poster_path"],
            e["adult"],
            e["overview"].isEmpty
                ? "Overview not found but may be a good film :)"
                : e["overview"],
            e["release_date"] ?? "Once upon a time",
            e["genres_ids"],
            e["original_title"],
            e["original_language"],
            e["title"],
            e["backdrop_path"] == null
                ? imageNotFoundUrl
                : image_url + e["backdrop_path"],
            e["popularity"],
            e["vote_count"],
            e["video"],
            e["vote_average"],
          ),
        )
        .toList();
    return movies;
  }

  Future<void> getPopulars({int pageNumber = 1}) async {
    Response<Map> response = await dio.get(popularsUrl + pageNumber.toString());
    List results = response.data!["results"];
    if (results.isEmpty) {
      populars = [];
    } else {
      populars = mapResultsToMovie(results);
      totalPopularPages = response.data!["total_pages"];
    }
    notifyListeners();
  }

  Future<void> getRecommendeds(
      {required String movieId, int pageNumber = 1}) async {
    String recommendationUrl =
        "https://api.themoviedb.org/3/movie/$movieId/recommendations?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=";
    Response<Map> response =
        await dio.get(recommendationUrl + pageNumber.toString());
    List results = response.data!["results"];
    if (results.isEmpty) {
      recommendeds = [];
    } else {
      recommendeds = mapResultsToMovie(results);
      totalRecommendedPages = response.data!["total_pages"];
    }
    notifyListeners();
  }

  Future<void> getUpComings({int pageNumber = 2}) async {
    Response<Map> response = await dio.get(upcomingUrl + pageNumber.toString());
    List results = response.data!["results"];
    if (results.isEmpty) {
      upcomings = [];
    } else {
      upcomings = mapResultsToMovie(results);
      totalUpcomingPages = response.data!["total_pages"];
      // print("Video : " + upcomings![0].video.toString());
    }
    notifyListeners();
  }

  Future<void> getTopRateds({int pageNumber = 1}) async {
    Response<Map> response = await dio.get(topRated + pageNumber.toString());
    List results = response.data!["results"];
    if (results.isEmpty) {
      topRateds = [];
    } else {
      topRateds = mapResultsToMovie(results);
      totalTopRatedPages = response.data!["total_pages"];
    }
    notifyListeners();
  }

  Future<void> getLatestMovies({int pageNumber = 1}) async {
    // print("worked");
    Response<Map> response = await dio.get(latestUrl + pageNumber.toString());
    List results = response.data!["results"];
    if (results.isEmpty) {
      latestMovies = [];
    } else {
      latestMovies = mapResultsToMovie(results);

      totalLatestPages = response.data!["total_pages"];
    }
    notifyListeners();
  }

  Future<void> searhMovies({String query = "", int pageNumber = 1}) async {
    final String searchUrl =
        "https://api.themoviedb.org/3/search/movie?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&query=$query&page=${pageNumber.toString()}&include_adult=false";
    Response<Map> response = await dio.get(searchUrl);
    List results = response.data!["results"];

    if (results.isEmpty) {
      searchResults = [];
    } else {
      searchResults = mapResultsToMovie(results);

      totalSearchPages = response.data!["total_pages"];
    }
    notifyListeners();
  }

  Future<void> getSimilarMovies({required String movieId}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieId/similar?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US&page=1";

    Response<Map> response = await dio.get(url);
    List results = response.data!["results"];
    if (results.isEmpty) {
      similarMovies = [];
    } else {
      similarMovies = mapResultsToMovie(results);
      totalSimilarMoviePages = response.data!["total_pages"];
    }
    notifyListeners();
  }

  Future<String?> getTrailer({required String movieId}) async {
    final String trailerKey =
        "http://api.themoviedb.org/3/movie/$movieId/videos?api_key=9240023865dd052e90b0564d9b5f6179";
    Response<Map> response = await dio.get(trailerKey);
    List results = response.data!["results"];
    if (results.isEmpty) {
      return null;
    } else {
      // print(results);
      String youtubeTrailer = results[0]["key"];
      return youtubeTrailer;
    }

    // return print(youtube_url + results[0]["key"]);
  }

  Future<void> functionWorker(dynamic function, {int pageNumber = 1}) async {
    if (function == moviesFunctions.populars) {
      await getPopulars(pageNumber: pageNumber);
    } else if (function == moviesFunctions.latests) {
      await getLatestMovies(pageNumber: pageNumber);
    }
    notifyListeners();
  }

  Future<void> getCastandDetails(String movieId) async {
    /// After sending this request get [casts] list

    String cast2 =
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=9240023865dd052e90b0564d9b5f6179";

    Response<Map> response = await dio.get(cast2);
    List<dynamic> castlist = response.data!["cast"];
    for (var element in castlist) {
      casts?.add(Cast.fromJson(element));
    }

    List results = response.data!["cast"];
    if (results.isEmpty) {
      casts = [];
    } else {
      casts = castlist.map((e) => Cast.fromJson(e)).toList();
    }
  }

  Future<CastDetail?> getCastDetails({required String castId}) async {
    String castDetailUrl =
        "https://api.themoviedb.org/3/person/$castId?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US";

    Response<Map> response = await dio.get(castDetailUrl);
    // print(response);
    // return response.data;
    if (response.data == null) return null;

    return CastDetail.fromJson((response.data as Map<String, dynamic>));
    // print(x.job);
    // return x;
    // // final x = Credit.fromJson(response.data ?? {});
    // // print(x.id);
  }

  Future<void> getReviews(String movieId) async {
    movieId = "550";
    String getReviewsUrl =
        "https://api.themoviedb.org/3/movie/$movieId?api_key=9240023865dd052e90b0564d9b5f6179&language=en-US";

    Response<Map> response = await dio.get(getReviewsUrl);
    print(response.data);
  }
}
