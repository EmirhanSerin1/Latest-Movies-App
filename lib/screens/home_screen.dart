import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/widgets/home_screen/single_popular_film.dart';
import 'package:latest_movies_app/screens/drawer.dart';
import 'package:latest_movies_app/widgets/home_screen/home_app_bar.dart';
import 'package:latest_movies_app/work/work_screen_2.dart';
import 'package:provider/provider.dart';

import '../providers/movies_prov.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          const HomeAppBar(),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 4),
            child: Text(
              "Popular Movies",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Consumer<MoviesProv>(
            builder: ((context, value, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.populars?.length,
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
            }),
          ),
        ],
      ),
    );
  }
}
