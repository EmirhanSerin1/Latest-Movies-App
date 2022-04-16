import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/widgets/movie_details/imdb_rate.dart';
import 'package:latest_movies_app/core/components/custom_text.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';

class PosterImageAndOtherInfos extends StatelessWidget {
  const PosterImageAndOtherInfos({
    Key? key,
    required this.tag,
    required this.posterPath,
    required this.name,
    required this.releaseDate,
    required this.voteCount,
    required this.voteAverage,
  }) : super(key: key);

  final String posterPath, name, releaseDate, voteCount, voteAverage;
  final String tag;
  @override
  Widget build(BuildContext context) {
    const paddingGeneralH = PaddingMovieDetails.generalPadding;
    print(tag + "33");

    return Positioned(
      top: 165,
      left: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          posterImage(tag.toString()),
          infos(context, paddingGeneralH),
        ],
      ),
    );
  }

  Container infos(BuildContext context, EdgeInsets paddingGeneralH) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
      margin: paddingGeneralH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 50),
          //? MovieName
          CustomText(
            text: name,
            textStyle: Theme.of(context).textTheme.headline6, //will make 22 ,
          ),
          // buildInfoText(movieItem.adult ? "Adult" : "Everyone", 14),
          const SizedBox(height: 8),
          //?ImdbRate
          ImdbRate(
            voteCount: voteCount,
            voteAverage: voteAverage,
          ),
          const SizedBox(height: 8),
          //?Release date
          CustomText(
            text: releaseDate.substring(0, releaseDate.length - 6),
            textStyle: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 8),
          CustomText(
            text: "Movie Lenght",
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  posterImage(Object tag) {
    return Hero(
      tag: tag != "Sonic the Hedgehog 2"  ? tag : DateTime.now(),
      child: SizedBox(
        width: 124,
        height: 200,
        child: CachedNetworkImage(
          imageUrl: posterPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
