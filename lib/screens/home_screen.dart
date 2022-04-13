import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/movies/latest_movies_list.dart';
import 'package:latest_movies_app/widgets/movies/popular_movie_list.dart';
import 'package:latest_movies_app/widgets/movies/recommended_movies_list.dart';
import 'package:provider/provider.dart';

import '../widgets/home_screen/home_app_bar.dart';
import '../widgets/home_screen/movies_title.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
          
        ],
      ),
    );
  }
}
