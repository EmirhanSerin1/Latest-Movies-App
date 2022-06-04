import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_prov.dart';
import 'single_film.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key, required this.typeOfMovie}) : super(key: key);

  final String typeOfMovie;

  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);

    return FutureBuilder(
      future: getFuture(prov),
      builder: (context, snapshot) {
        return Consumer<MoviesProv>(
          builder: (context, value, child) {
            List<Movie>? itemList = getItemList(value);
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemList!.length,
                itemBuilder: (context, index) {
                  Movie item = getItem(value, index);

                  return SingleFilmItem(
                    adult: item.adult,
                    overview: item.overview ?? "",
                    backgroungPath: item.backdrop_path ?? "",
                    name: item.title,
                    imagePath: item.posterPath ?? "",
                    heroTag: item.title,
                    id: item.id.toString(),
                    releaseDate: item.release_date,
                    voteAverage: item.vote_average.toString(),
                    voteCount: item.vote_count.toString(),
                    movieList: itemList,
                    value: value,
                    typeOfList: typeOfMovie,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Future<void>? getFuture(MoviesProv prov) {
    if (typeOfMovie == "populars") {
      return prov.getPopulars();
    } else if (typeOfMovie == "recommended") {
      return prov.getRecommendeds(movieId: "100");
    } else if (typeOfMovie == "latest") {
      return prov.getLatestMovies();
    } else {
      return prov.getPopulars();
    }
  }

  List<Movie>? getItemList(MoviesProv value) {
    if (typeOfMovie == "populars") {
      return value.populars;
    } else if (typeOfMovie == "recommended") {
      return value.recommendeds;
    } else if (typeOfMovie == "latest") {
      return value.latestMovies;
    } else {
      return value.populars;
    }
  }

  Movie getItem(MoviesProv value, int index) {
    if (typeOfMovie == "populars") {
      return value.populars![index];
    } else if (typeOfMovie == "recommended") {
      return value.recommendeds![index];
    } else if (typeOfMovie == "latest") {
      return value.latestMovies![index];
    } else {
      return value.populars![index];
    }
  }
}
