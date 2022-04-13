import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/movies/latest_movies_list.dart';
import 'package:latest_movies_app/widgets/movies/popular_movie_list.dart';
import 'package:latest_movies_app/widgets/movies/recommended_movies_list.dart';
import 'package:provider/provider.dart';

import '../providers/movies_prov.dart';
import '../widgets/home_screen/home_app_bar.dart';
import '../widgets/home_screen/movies_title.dart';
import '../widgets/home_screen/single_movie_controller.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);
    // For taking datas

    return Scaffold(
      drawer: const CustomDrawer(),
      body: ListView(
        children: const [
          HomeAppBar(),
          MoviesTitle(title: "Popular Movies"),
          PopularMoviesList(),
          MoviesTitle(title: "Latest Movies"),
          LatestMoviesList(),
          MoviesTitle(title: "Recommendeds"),
          RecommendedMoviesList()
          // TypeOfMovies(nameOfList: "populars"),
          // TypeOfMovies(nameOfList: "latest"),
          // SizedBox(height: 500),
        ],
      ),
    );
  }
}
