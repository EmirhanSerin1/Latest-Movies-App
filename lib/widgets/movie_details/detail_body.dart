import 'package:flutter/material.dart';

import '../../models/movie.dart';
import 'background.dart';
import 'overview.dart';
import 'pop_icon.dart';
import 'poster_image_and_infos.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.movieItem}) : super(key: key);
  final Movie movieItem;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 400,
          child: Stack(
            children: [
              BackgroundImage(movieItem: movieItem),
              const PopIcon(),
              PosterImageAndOtherInfos(movieItem: movieItem),
            ],
          ),
        ),
        // * 3 have to deleted
        OverView(text: movieItem.overview.toString() * 3)
      ],
    );
  }
}

