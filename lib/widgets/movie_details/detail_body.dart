import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.movieItem}) : super(key: key);
  final Movie movieItem;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 230,
          child: Image.network(
            movieItem.backdrop_path ?? "",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(160, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? MovieName
              buildInfoText(movieItem.title, 22),
              // buildInfoText(movieItem.adult ? "Adult" : "Everyone", 14),
              const SizedBox(height: 4),
              //?ImdbRate
              buildIMDbRate(),
              const SizedBox(height: 4),
              //?Release date
              buildInfoText(
                movieItem.release_date
                    .substring(0, movieItem.release_date.length - 6),
                14,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "OverView",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(movieItem.overview.toString()),
            ],
          ),
        )
      ],
    );
  }

  buildIMDbRate() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            padding: const EdgeInsets.only(left: 6, right: 6),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(2)),
            child: buildInfoText(movieItem.vote_average.toString(), 12),
          ),
        ),
        Text("-  "),
        buildInfoText("Result of " + movieItem.vote_count.toString() + " votes", 11)
      ],
    );
  }

  buildInfoText(String text, double? fontSize) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
