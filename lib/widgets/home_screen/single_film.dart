import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  }) : super(key: key);

  final String name,
      imagePath,
      heroTag,
      backgroungPath,
      overview,
      id,
      releaseDate,
      voteCount,
      voteAverage;
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
          color: Colors.grey.shade800,
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MovieDetails(
                  contextForPalet: context,
                  backgroungPath: widget.backgroungPath,
                  imagePath: widget.imagePath,
                  name: widget.name,
                  overview: widget.overview,
                  id: widget.id,
                  releaseDate: widget.releaseDate,
                  voteAverage: widget.voteAverage,
                  voteCount: widget.voteCount,
                );
              },
            ),
          ),
          child: Hero(
            tag: widget.heroTag == "Sonic the Hedgehog 2" ? DateTime.now() : widget.heroTag,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    widget.imagePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.6,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
