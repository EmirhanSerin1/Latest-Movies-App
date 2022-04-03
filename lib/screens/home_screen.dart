import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/home_screen/movies_title.dart';
import 'package:latest_movies_app/widgets/home_screen/single_movie_controller.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../providers/movies_prov.dart';
import '../widgets/home_screen/home_app_bar.dart';
import '../widgets/home_screen/single_popular_film.dart';
import '../work/work_screen_2.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);
    // For taking datas
    callProv(prov);

    return Scaffold(
      drawer: const CustomDrawer(),
      body: ListView(
        children: const [
          HomeAppBar(),
          MoviesTitle(title: "Popular Movies"),
          TypeOfMovies(nameOfList: "populars"),
          //   )
        ],
      ),
    );
  }

  // We could call in initState. I did like this just for now. If I will delete this. Apps not calling apis.
  void callProv(MoviesProv prov) async {
    final response = await prov.getPopulars(2);
    debugPrint(response);
  }
}


