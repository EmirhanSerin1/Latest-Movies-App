import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/movie_details/background.dart';
import 'package:latest_movies_app/widgets/movie_details/details_body_box_dec.dart';
import 'package:latest_movies_app/widgets/movie_details/overview.dart';
import 'package:latest_movies_app/widgets/movie_details/pop_icon.dart';
import 'package:latest_movies_app/widgets/movie_details/poster_image_and_infos.dart';
import 'package:latest_movies_app/widgets/movie_details/trailer.dart';
import 'package:palette_generator/palette_generator.dart';

import '../models/movie.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails(
      {Key? key,
      required this.contextForPalet,
      required this.overview,
      required this.imagePath,
      required this.name,
      required this.backgroungPath,
      required this.voteCount,
      required this.voteAverage,
      required this.releaseDate,
      required this.id})
      : super(key: key);
  final BuildContext contextForPalet;
  final String overview,
      imagePath,
      name,
      backgroungPath,
      voteCount,
      voteAverage,
      releaseDate,
      id;

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
    print(widget.name + "1");
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          decoration: detailsBodyBoxDecoration(dominant, muted),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
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
                    ),
                  ],
                ),
              ),
              OverView(text: widget.overview),
              Trailer(id: widget.id),
            ],
          ),
        ),
      ),
    ));
  }
}
