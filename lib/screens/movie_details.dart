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
  final Movie movie;
  const MovieDetails(
      {Key? key, required this.movie, required this.contextForPalet})
      : super(key: key);
  final BuildContext contextForPalet;
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
            NetworkImage(
                widget.movie.backdrop_path ?? "assets/flutter_dark.png"),
            size: Size(width, width * 5 / 9));

    dominant =
        paletteGenerator.dominantColor ?? PaletteColor(Colors.grey.shade800, 2);
    muted =
        paletteGenerator.mutedColor ?? PaletteColor(Colors.grey.shade800, 2);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Movie movieItem = widget.movie;

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
                    BackgroundImage(movieItem: movieItem),
                    const PopIcon(),
                    PosterImageAndOtherInfos(movieItem: movieItem),
                  ],
                ),
              ),
              OverView(text: movieItem.overview.toString()),
              Trailer(movieItem: movieItem),
            ],
          ),
        ),
      ),
    ));
  }
}
