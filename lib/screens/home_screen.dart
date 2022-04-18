import 'package:flutter/material.dart';

import '../widgets/home_screen/home_app_bar.dart';
import '../widgets/home_screen/movie_list.dart';
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
          MovieList(typeOfMovie: "populars"),
          MoviesTitle(title: "Recommendeds"),
          MovieList(typeOfMovie: "recommended"),
          MoviesTitle(title: "Latest Movies"),
          MovieList(typeOfMovie: "latest"),
        ],
      ),
    );
  }
}
