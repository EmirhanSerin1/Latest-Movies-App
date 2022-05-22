import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/home_screen/top_random.dart';

import '../widgets/home_screen/home_app_bar.dart';
import '../widgets/home_screen/movie_list.dart';
import '../widgets/home_screen/movies_title.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 30),
      drawer: const CustomDrawer(),
      body: ListView(
        children: const [
          HomeAppBar(),
          HomeRandomMovie(),
          MoviesTitle(title: "Popular Movies"),
          MovieList(typeOfMovie: "populars"),
          // MoviesTitle(title: "Recommendeds"),
          // MovieList(typeOfMovie: "recommended"),
          // MoviesTitle(title: "Latest Movies"),
          // MovieList(typeOfMovie: "latest"),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
