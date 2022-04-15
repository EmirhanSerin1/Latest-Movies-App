import 'package:flutter/material.dart';
import 'package:latest_movies_app/screens/movie_details.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_prov.dart';
import '../../work/work_screen_2.dart';
import '../home_screen/single_popular_film.dart';

class RecommendedMoviesList extends StatelessWidget {
  const RecommendedMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);

    return FutureBuilder(
      future: prov.getRecommendeds(movieId: "100"),
      builder: (context, snapshot) {
        return Consumer<MoviesProv>(
          builder: (context, value, child) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.recommendeds!.length,
                itemBuilder: (context, index) {
                  Movie item = value.recommendeds![index];
                  return SingleFilmItem(
                    widget: MovieDetails(movie: item),
                    name: item.title,
                    imagePath: item.posterPath ?? "",
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
