import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/movie_details/detail_body.dart';

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


