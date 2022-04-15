
import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/widgets/movie_details/Imdb_rate.dart';
import 'package:latest_movies_app/widgets/movie_details/custom_text.dart';

class PosterImageAndOtherInfos extends StatelessWidget {
  const PosterImageAndOtherInfos({
    Key? key,
    required this.movieItem,
  }) : super(key: key);

  final Movie movieItem;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 165,
      left: 20,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            width: 124,
            height: 200,
            child: Image.network(
              movieItem.posterPath ?? "",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? MovieName
                CustomText(
                  text: movieItem.title,
                  fontSize: 22,
                ),
                // buildInfoText(movieItem.adult ? "Adult" : "Everyone", 14),
                const SizedBox(height: 4),
                //?ImdbRate
                ImdbRate(movieItem: movieItem),
                const SizedBox(height: 4),
                //?Release date
                CustomText(
                  text: movieItem.release_date
                      .substring(0, movieItem.release_date.length - 6),
                  fontSize: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
