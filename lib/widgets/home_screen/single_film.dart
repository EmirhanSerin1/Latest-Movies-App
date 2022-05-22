import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:latest_movies_app/core/components/page_route.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/screens/movie_details.dart';

class SingleFilmItem extends StatefulWidget {
  const SingleFilmItem({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.heroTag,
    required this.backgroungPath,
    required this.overview,
    required this.id,
    required this.releaseDate,
    required this.voteCount,
    required this.voteAverage,
    required this.movieList,
    required this.value,
    required this.typeOfList,
    required this.adult,
  }) : super(key: key);

  final String name,
      imagePath,
      heroTag,
      backgroungPath,
      overview,
      id,
      releaseDate,
      voteCount,
      voteAverage,
      typeOfList;
  final bool adult;
  final List<Movie>? movieList;
  final MoviesProv value;

  @override
  State<SingleFilmItem> createState() => _SingleFilmItemState();
}

class _SingleFilmItemState extends State<SingleFilmItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              createRoute(
                MovieDetails(
                  contextForPalet: context,
                  backgroungPath: widget.backgroungPath,
                  imagePath: widget.imagePath,
                  name: widget.name,
                  overview: widget.overview,
                  id: widget.id,
                  releaseDate: widget.releaseDate,
                  voteAverage: widget.voteAverage,
                  voteCount: widget.voteCount,
                  movieList: widget.movieList,
                  value: widget.value,
                  typeOfList: widget.typeOfList,
                  adult: widget.adult,
                ),
                x: 1,
                y: 1,
              ),
            );
          },
          child: Hero(
            tag: widget.name,
            child: Material(
              color: Colors.transparent,
              child: SizedBox(
                child: AspectRatio(
                  aspectRatio: 7 / 10.2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        widget.name,
                        style:
                            Theme.of(context).textTheme.bodyText2!.copyWith(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getTag() {
    List<dynamic> listNow = widget.movieList!.map((e) => e.title).toList();

    dynamic recommendedNameList =
        widget.value.recommendeds!.map((e) => e.title).toList();

    dynamic popularNameList =
        widget.value.populars!.map((e) => e.title).toList();

    dynamic latestNameList =
        widget.value.latestMovies!.map((e) => e.title).toList();

    if (widget.typeOfList == "populars") {
      if (listNow
              .where((element) => recommendedNameList.contains(widget.name))
              .toList()
              .isEmpty &&
          listNow
              .where((element) => latestNameList.contains(widget.name))
              .toList()
              .isEmpty) {
        return widget.name;
      } else {
        return DateTime.now();
      }
    } else if (widget.typeOfList == "recommended") {
      if (listNow
              .where((element) => popularNameList.contains(widget.name))
              .toList()
              .isEmpty &&
          listNow
              .where((element) => latestNameList.contains(widget.name))
              .toList()
              .isEmpty) {
        return widget.name;
      } else {
        return DateTime.now();
      }
    } else if (widget.typeOfList == "latest") {
      if (listNow
              .where((element) => popularNameList.contains(widget.name))
              .toList()
              .isEmpty &&
          listNow
              .where((element) => recommendedNameList.contains(widget.name))
              .toList()
              .isEmpty) {
        return widget.name;
      } else {
        return DateTime.now();
      }
    } else {
      return DateTime.now();
    }
  }
}
