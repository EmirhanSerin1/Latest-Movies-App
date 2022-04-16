import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/constants/colors/colors_movie_details.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';

class PopIcon extends StatelessWidget {
  const PopIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: ColorsMovieDetails.popButtonColor,
        ),
        padding: PaddingMovieDetails.popButtonPadding,
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
