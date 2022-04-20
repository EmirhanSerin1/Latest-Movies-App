import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/constants/texts/text_movie_details.dart';

class ImdbRate extends StatelessWidget {
  const ImdbRate({
    Key? key,
    required this.voteCount,
    required this.voteAverage,
  }) : super(key: key);
  final String voteCount, voteAverage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        rate(context),
        const Text("-  "),
        Text(
          "Result of " + voteCount + " votes",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }

  Padding rate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(2)),
        child: Text(
          voteAverage == "0"
              ? MovieDetailsTexts.nA
              : voteAverage.length < 3
                  ? voteAverage
                  : voteAverage.substring(0, 3),
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
