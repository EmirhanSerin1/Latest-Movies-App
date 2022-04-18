import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/components/custom_text.dart';
import 'package:latest_movies_app/core/components/page_route.dart';
import 'package:latest_movies_app/core/constants/box_properties/box_prop_movie_details.dart';
import 'package:latest_movies_app/core/constants/images/movie_details_images.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/widgets/movie_details/background.dart';
import 'package:latest_movies_app/widgets/movie_details/details_body_box_dec.dart';
import 'package:latest_movies_app/widgets/movie_details/overview.dart';
import 'package:latest_movies_app/widgets/movie_details/pop_icon.dart';
import 'package:latest_movies_app/widgets/movie_details/poster_image_and_infos.dart';
import 'package:latest_movies_app/widgets/movie_details/trailer.dart';
import 'package:palette_generator/palette_generator.dart';

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
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height, minWidth: MediaQuery.of(context).size.width),
          decoration: detailsBodyBoxDecoration(dominant, muted),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                    padding: PaddingMovieDetails.horizontalPadding +
                        const EdgeInsets.only(top: 40, bottom: 10),
                    child: CustomText(
                      text: "Trailer",
                      textStyle: Theme.of(context).textTheme.headline6,
                    ),
                  ),
              SizedBox(
                child: Hero(
                  tag: "special",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 350),
                      margin: PaddingMovieDetails.horizontalPadding +
                          const EdgeInsets.only(bottom: 40),
                      width: double.infinity,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          createRoute(Trailer(id: widget.id), x: 0, y: 1),
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(MovieDetailsImages.youtube),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
