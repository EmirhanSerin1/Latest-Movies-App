import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../models/movie.dart';
import '../widgets/movie_details/detail_body.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  const MovieDetails({Key? key, required this.movie, required this.contextForPalet}) : super(key: key);
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
            size: Size(width,width*5/9));

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
      body: DetailsBody(
        movieItem: movieItem,
        dominant: dominant,
        muted: muted,
      ),
    );
  }
}
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


