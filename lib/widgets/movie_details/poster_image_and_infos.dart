import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/constants/box_properties/box_prop_movie_details.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
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
    required this.movieList,
    required this.value,
    required this.typeOfList,
    required this.adult,
  }) : super(key: key);

  final String posterPath,
      name,
      releaseDate,
      voteCount,
      voteAverage,
      typeOfList;
  final String tag;
  final bool adult;

  final List<Movie>? movieList;
  final MoviesProv value;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 165,
      left: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          posterImage(tag.toString(), context),
          infos(context),
        ],
      ),
    );
  }

  Container infos(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 2,
          minHeight: MovieDetailsBoxProperties.minHeigt),
      margin: PaddingMovieDetails.horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: MovieDetailsBoxProperties.upMovieName),
          //? MovieName
          Text(name, style: Theme.of(context).textTheme.headline6),
          //?ImdbRate
          ImdbRate(
            voteCount: voteCount,
            voteAverage: voteAverage,
          ),
          //?Release date
          CustomText(
            text: releaseDate.isEmpty
                ? "n/a"
                : releaseDate.substring(0, releaseDate.length - 6),
            textStyle: Theme.of(context).textTheme.caption,
          ),
          CustomText(
            text: adult ? "Everyone can watch" : "Only adults can watch",
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  posterImage(Object tag, BuildContext context) {
    return Hero(
      tag: _getTag(),
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: MovieDetailsBoxProperties.posterImageHeight,
          child: AspectRatio(
            aspectRatio: 7 / 10,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(posterPath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.transparent),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getTag() {
    List<dynamic> listNow = movieList!.map((e) => e.title).toList();

    List<dynamic> recommendedNameList =
        value.recommendeds!.map((e) => e.title).toList();
    List<dynamic> popularNameList =
        value.populars!.map((e) => e.title).toList();
    List<dynamic> latestNameList =
        value.latestMovies!.map((e) => e.title).toList();

    if (typeOfList == "populars") {
      if (listNow
              .where((element) => recommendedNameList.contains(name))
              .toList()
              .isEmpty &&
          listNow
              .where((element) => latestNameList.contains(name))
              .toList()
              .isEmpty) {
        return name;
      } else {
        return DateTime.now();
      }
    } else if (typeOfList == "recommended") {
      if (listNow
              .where((element) => popularNameList.contains(name))
              .toList()
              .isEmpty &&
          listNow
              .where((element) => latestNameList.contains(name))
              .toList()
              .isEmpty) {
        return name;
      } else {
        return DateTime.now();
      }
    } else if (typeOfList == "latest") {
      if (listNow
              .where((element) => popularNameList.contains(name))
              .toList()
              .isEmpty &&
          listNow
              .where((element) => recommendedNameList.contains(name))
              .toList()
              .isEmpty) {
        return name;
      } else {
        return DateTime.now();
      }
    } else {
      return DateTime.now();
    }
  }
}
