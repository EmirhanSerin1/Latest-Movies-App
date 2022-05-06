import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/movie_details/movie_details_exports.dart';

import 'package:palette_generator/palette_generator.dart';

import '../core/constants/box_properties/box_prop_movie_details.dart';
import '../models/movie.dart';
import '../providers/movies_prov.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    Key? key,
    required this.contextForPalet,
    required this.overview,
    required this.imagePath,
    required this.name,
    required this.backgroungPath,
    required this.voteCount,
    required this.voteAverage,
    required this.releaseDate,
    required this.movieList,
    required this.value,
    required this.id,
    required this.typeOfList,
    required this.adult,
  }) : super(key: key);
  final BuildContext contextForPalet;
  final String overview,
      imagePath,
      name,
      backgroungPath,
      voteCount,
      voteAverage,
      releaseDate,
      id,
      typeOfList;
  final bool adult;
  final List<Movie>? movieList;
  final MoviesProv value;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  PaletteColor? dominant;
  PaletteColor? muted;

  @override
  void initState() {
    super.initState();
    dominant = PaletteColor(Colors.grey.shade800, 2);
    muted = PaletteColor(Colors.grey.shade800, 2);
    _updatePalettes();
  }

  _updatePalettes() async {
    double width = MediaQuery.of(widget.contextForPalet).size.width;

    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
            NetworkImage(widget.backgroungPath),
            size: Size(width, width * 5 / 9));

    dominant =
        paletteGenerator.dominantColor ?? PaletteColor(Colors.grey.shade800, 2);
    muted =
        paletteGenerator.mutedColor ?? PaletteColor(Colors.grey.shade800, 2);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width),
      child: ListView(
        children: [
          RepaintBoundary(
            child: DecoratedBox(
              decoration: detailsBodyBoxDecoration(dominant, muted),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MovieDetailsBoxProperties.upBodyHeight,
                    child: Stack(
                      children: [
                        BackgroundImage(path: widget.backgroungPath),
                        const PopIcon(),
                        PosterImageAndOtherInfos(
                          tag: widget.name,
                          name: widget.name,
                          posterPath: widget.imagePath,
                          releaseDate: widget.releaseDate,
                          voteAverage: widget.voteAverage,
                          voteCount: widget.voteCount,
                          movieList: widget.movieList,
                          value: widget.value,
                          typeOfList: widget.typeOfList,
                          adult: widget.adult,
                        ),
                      ],
                    ),
                  ),
                  OverView(text: widget.overview),
                ],
              ),
            ),
          ),
          CastList(
            muted: muted,
            id: widget.id,
            motherMovieImage: widget.backgroungPath,
          ),
          TrailerPart(widget: widget),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}
