
import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        path,
        fit: BoxFit.cover,
      ),
    );
  }
}

