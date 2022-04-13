import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_prov.dart';
import '../../work/work_screen_2.dart';
import '../home_screen/single_popular_film.dart';

class RecommendedMoviesList extends StatelessWidget {
  const RecommendedMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageOffSet = 0;
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

                  return Transform.scale(
                    scale: 1,
                    child: SingleFilmItem(
                      widget: WorkScreen2(movie: item),
                      name: item.title,
                      imagePath: item.posterPath ?? "",
                    ),
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
