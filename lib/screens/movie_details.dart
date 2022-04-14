import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/widgets/movie_details/detail_body.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    Movie movieItem = widget.movie;

    return Scaffold(
      body: Stack(
        children: [
          DetailsBody(movieItem: movieItem),
          const PopIcon(),
          PosterImage(movieItem: movieItem),
        ],
      ),
      // body: ListView(
      //   children: [
      //     FutureBuilder(
      //         future: Provider.of<MoviesProv>(context, listen: false)
      //             .getTrailer(movieId: movieItem.id.toString()),
      //         builder: (context, snapshot) {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return const Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           }

      //           return Expanded(
      //             child: YoutubePlayerIFrame(
      //               controller: YoutubePlayerController(
      //                 initialVideoId: 'K18cpp_-gP8',
      //                 params: YoutubePlayerParams(
      //                   playlist: [
      //                     (snapshot.data as String)
      //                   ], // Defining custom playlist
      //                   // startAt: Duration(seconds: 30),
      //                   showControls: true,
      //                   showFullscreenButton: true,
      //                 ),
      //               ),
      //               aspectRatio: 16 / 9,
      //             ),
      //           );
      //         }),
      //     Text("poster image"),
      // Image.network(
      //   movieItem.posterPath ?? "",
      //   width: 100,
      //   height: 100,
      // ),
      //     Text("background image"),
      //     Image.network(
      //       movieItem.backdrop_path ?? "",
      //       width: 100,
      //       height: 100,
      //     ),
      //     Text(movieItem.title),
      //     Text(movieItem.original_language),
      //     Text(movieItem.release_date),
      //     Text(movieItem.popularity.toString()),
      //     Text(movieItem.overview.toString()),
      //   ],
      // ),
    );
  }
}

class PosterImage extends StatelessWidget {
  const PosterImage({
    Key? key,
    required this.movieItem,
  }) : super(key: key);

  final Movie movieItem;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 195,
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(3, 3),
            ),
          ],
        ),
        width: 124,
        height: 200,
        child: Image.network(
          movieItem.posterPath ?? "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PopIcon extends StatelessWidget {
  const PopIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: const Color.fromARGB(255, 73, 71, 71).withOpacity(0.6),
        ),
        padding: const EdgeInsets.all(5),
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
