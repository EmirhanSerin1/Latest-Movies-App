import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/widgets/movie_details/imdb_rate.dart';
import 'package:latest_movies_app/core/components/custom_text.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';

class PosterImageAndOtherInfos extends StatelessWidget {
  const PosterImageAndOtherInfos({
    Key? key,
    required this.movieItem,
  }) : super(key: key);

  final Movie movieItem;

  @override
  Widget build(BuildContext context) {
    const paddingGeneralH = PaddingMovieDetails.generalPadding;

    return Positioned(
      top: 165,
      left: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          posterImage(),
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
            text: movieItem.title,
            textStyle: Theme.of(context).textTheme.headline6, //will make 22 ,
          ),
          // buildInfoText(movieItem.adult ? "Adult" : "Everyone", 14),
          const SizedBox(height: 8),
          //?ImdbRate
          ImdbRate(movieItem: movieItem),
          const SizedBox(height: 8),
          //?Release date
          CustomText(
            text: movieItem.release_date
                .substring(0, movieItem.release_date.length - 6),
            textStyle: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 8),
          CustomText(
            text: "Movie Lenght",
            textStyle:
                Theme.of(context).textTheme.bodySmall,
           ),
        ],
      ),
    );
  }

  SizedBox posterImage() {
    return SizedBox(
    
      width: 124,
      height: 200,
      child: Image.network(
        movieItem.posterPath ?? "",
        fit: BoxFit.cover,
      ),
    );
  }
}
