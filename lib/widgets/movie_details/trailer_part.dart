import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/components/page_route.dart';
import 'package:latest_movies_app/core/constants/box_properties/box_prop_movie_details.dart';
import 'package:latest_movies_app/core/constants/images/movie_details_images.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';
import 'package:latest_movies_app/screens/movie_details.dart';
import 'package:latest_movies_app/screens/trailer.dart';

class TrailerPart extends StatelessWidget {
  const TrailerPart({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MovieDetails widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: PaddingMovieDetails.horizontalPadding +
                PaddingMovieDetails.trailerVertical,
            child: Text(
              "Trailer",
              style: Theme.of(context).textTheme.headline6,
            )),
        SizedBox(
          child: Hero(
            tag: "special",
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 350),
                margin: PaddingMovieDetails.horizontalPadding,
                width: double.infinity,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(
                    createRoute(Trailer(id: widget.id), x: 0, y: 1),
                  ),
                  child: AspectRatio(
                    aspectRatio: MovieDetailsBoxProperties.aspectRadio,
                    child: Image.asset(MovieDetailsImages.youtube),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
