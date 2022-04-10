import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/home_screen/single_popular_film.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_prov.dart';
import '../../work/work_screen_2.dart';

class TypeOfMovies extends StatefulWidget {
  const TypeOfMovies({
    Key? key,
    required this.nameOfList,
  }) : super(key: key);
  final String nameOfList;

  @override
  State<TypeOfMovies> createState() => _TypeOfMoviesState();
}

class _TypeOfMoviesState extends State<TypeOfMovies> {
  PageController pageController = PageController();
  double pageOffSet = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffSet = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProv>(
      builder: ((context, value, child) {
        if (widget.nameOfList == "popular") {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.populars!.length,
              itemBuilder: (context, index) {
                Movie item = value.populars![index];
                // print(item.backdrop_path);

                return SingleFilmItem(
                  alignment: Alignment(-pageOffSet.abs()+index,0),
                  widget: WorkScreen2(movie: item),
                  name: item.title,
                  imagePath: item.posterPath ?? "",
                );
              },  
            ),
          );
        } else {
          return SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: value.populars!.length,
              controller: pageController,
              itemBuilder: (context, index) {
                Movie item = value.populars![index];
                return Transform.scale(
                  scale: 1,
                  child: SingleFilmItem(
                    alignment: Alignment(0,-pageOffSet.abs()+index),
                    widget: WorkScreen2(movie: item),
                    name: item.title,
                    imagePath: item.posterPath ?? "",
                  ),
                );
              },
            ),

            //ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: value.populars!.length,
            //   itemBuilder: (context, index) {
            //     Movie item = value.populars![index];
            //     // print(item.backdrop_path);
            //     return SingleFilmItem(
            //         widget: WorkScreen2(movie: item),
            //         name: item.title,
            //         imagePath: item.posterPath ?? "");
            //   },
            // ),
          );
        }
      }),
    );
  }
}
