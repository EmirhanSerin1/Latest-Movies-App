
import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.movieItem,
  }) : super(key: key);

  final Movie movieItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        movieItem.backdrop_path ?? "",
        fit: BoxFit.cover,
      ),
    );
  }
}

