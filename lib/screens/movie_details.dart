import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
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
          ListView(
            children: [
              SizedBox(
                width: double.infinity,
                height: 230,
                child: Image.network(
                  movieItem.backdrop_path ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(160, 8, 8, 8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieItem.title,
                        style: const TextStyle(fontSize: 22),
                      ),
                      Text(
                        movieItem.adult ? "Adult" : "Everyone",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          movieItem.vote_average.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        movieItem.release_date
                            .substring(0, movieItem.release_date.length - 6),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 55, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text(
                        "OverView",
                        style:  TextStyle(fontSize: 20),
                      ),
                    const  SizedBox(height: 4),
                    Text(movieItem.overview.toString()),
                  ],
                ),
              )
            ],
          ),
          Positioned(
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
          ),
          Positioned(
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
          ),
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
