import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/components/custom_text.dart';
import 'package:latest_movies_app/core/components/page_route.dart';
import 'package:latest_movies_app/core/constants/box_properties/box_prop_movie_details.dart';
import 'package:latest_movies_app/core/constants/images/movie_details_images.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';
import 'package:latest_movies_app/models/cast.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/widgets/movie_details/background.dart';
import 'package:latest_movies_app/widgets/movie_details/details_body_box_dec.dart';
import 'package:latest_movies_app/widgets/movie_details/overview.dart';
import 'package:latest_movies_app/widgets/movie_details/pop_icon.dart';
import 'package:latest_movies_app/widgets/movie_details/poster_image_and_infos.dart';
import 'package:latest_movies_app/screens/trailer.dart';
import 'package:latest_movies_app/widgets/movie_details/trailer_part.dart';
import 'package:latest_movies_app/work/cast_detail_screen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

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
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);

    return Scaffold(
        body: Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width),
      decoration: detailsBodyBoxDecoration(dominant, muted),
      child: ListView(
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 120,
            child: FutureBuilder(
              future: Provider.of<MoviesProv>(context, listen: false)
                  .getCastandDetails(widget.id),
              builder: (context, snapshot) {
                List<Cast> casts = prov.casts ?? [];

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return RepaintBoundary(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const SizedBox(
                          width: 70,
                          height: 70,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: RepaintBoundary(
                                child:
                                    Center(child: CircularProgressIndicator())),
                          ),
                        );
                      },
                      itemCount: casts.length,
                    ),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).push(createRoute(CastDetailsScreen(castId: casts[index].id.toString()), x: 1, y: 1)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    casts[index].profilePath != null
                                        ? "https://image.tmdb.org/t/p/w500" +
                                            (casts[index].profilePath!)
                                        : "https://i0.wp.com/1.bp.blogspot.com/_saHCz6YS_o0/S2gmYeLBmXI/AAAAAAAAAds/XeUYqR1QWAY/s320/unknown-person.gif?zoom=2",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              
                              casts[index].name ?? "",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          
                        ],
                      );
                    },
                    itemCount: casts.length,
                  );
                }
              },
            ),
          ),
          TrailerPart(widget: widget),
        ],
      ),
    ));
  }
}
