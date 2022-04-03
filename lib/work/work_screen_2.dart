import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WorkScreen2 extends StatefulWidget {
  final Movie movie;
  const WorkScreen2({Key? key, required this.movie}) : super(key: key);

  @override
  State<WorkScreen2> createState() => _WorkScreen2State();
}

class _WorkScreen2State extends State<WorkScreen2> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'K18cpp_-gP8',
    params: YoutubePlayerParams(
      playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Movie movieItem = widget.movie;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: Provider.of<MoviesProv>(context, listen: false)
                      .getTrailer(movieId: movieItem.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    print(snapshot.data);
                    return Expanded(
                      child: YoutubePlayerControllerProvider(
                        // Provides controller to all the widget below it.
                        controller: _controller,
                        child: YoutubePlayerIFrame(
                          controller: YoutubePlayerController(
                            initialVideoId: 'K18cpp_-gP8',
                            params: YoutubePlayerParams(
                              playlist: [
                                (snapshot.data as String)
                              ], // Defining custom playlist
                              // startAt: Duration(seconds: 30),
                              showControls: true,
                              showFullscreenButton: true,
                            ),
                          ),
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    );
                  }),
              Text("poster image"),
              Image.network(
                movieItem.posterPath ?? "",
                width: 100,
                height: 100,
              ),
              Text("background image"),
              Image.network(
                movieItem.backdrop_path ?? "",
                width: 100,
                height: 100,
              ),
              Text(movieItem.title),
              Text(movieItem.original_language),
              Text(movieItem.release_date),
              Text(movieItem.popularity.toString()),
              Text(movieItem.overview.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
