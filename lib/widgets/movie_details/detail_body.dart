import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/screens/movie_details.dart';
import 'package:latest_movies_app/widgets/movie_details/background.dart';
import 'package:latest_movies_app/widgets/movie_details/overview.dart';
import 'package:latest_movies_app/widgets/movie_details/pop_icon.dart';
import 'package:latest_movies_app/widgets/movie_details/poster_image_and_infos.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.movieItem}) : super(key: key);
  final Movie movieItem;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 395,
          child: Stack(
            children: [
              BackgroundImage(movieItem: movieItem),
              const PopIcon(),
              PosterImageAndOtherInfos(movieItem: movieItem),
            ],
          ),
        ),
        // * 3 will delete
        OverView(text: movieItem.overview.toString() * 3)
      ],
    );
  }
}

