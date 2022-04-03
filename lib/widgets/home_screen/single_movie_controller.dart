import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/home_screen/single_popular_film.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_prov.dart';
import '../../work/work_screen_2.dart';

class TypeOfMovies extends StatelessWidget {
  const TypeOfMovies({
    Key? key,
    required this.nameOfList,
  }) : super(key: key);
  final String nameOfList;

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProv>(
      builder: ((context, value, child) {
        if (nameOfList == "populars") {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.populars!.length,
              itemBuilder: (context, index) {
                Movie item = value.populars![index];
                // print(item.backdrop_path);

                return SingleFilmItem(
                    widget: WorkScreen2(movie: item),
                    name: item.title,
                    imagePath: item.posterPath ?? "");
              },
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.populars!.length,
              itemBuilder: (context, index) {
                Movie item = value.populars![index];
                // print(item.backdrop_path);
                return SingleFilmItem(
                    widget: WorkScreen2(movie: item),
                    name: item.title,
                    imagePath: item.posterPath ?? "");
              },
            ),
          );
        }
      }),
    );
  }
}