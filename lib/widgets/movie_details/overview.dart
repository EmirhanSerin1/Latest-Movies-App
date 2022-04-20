import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingMovieDetails.horizontalPadding + EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OverView",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }
}
