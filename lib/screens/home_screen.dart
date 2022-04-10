import 'package:flutter/material.dart';
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
    callProv(prov);

    return Scaffold(
      drawer: const CustomDrawer(),
      body: ListView(
        children:  [
          HomeAppBar(),
          MoviesTitle(title: "Popular Movies"),
          TypeOfMovies(nameOfList: "populars"),
          MoviesTitle(title: "Latest Movies"),
          TypeOfMovies(nameOfList: "latest"),
          Container(height: 500,),
        ],
      ),
    );
  }

  // We could call in initState. I did like this just for now. If I will delete this. Apps not calling apis.
  void callProv(MoviesProv prov) async {
    final response = await prov.getPopulars(pageNumber: 2);
    // debugPrint(response);
  }
}
