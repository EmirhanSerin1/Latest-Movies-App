import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/work/video/metadata.dart';
// import 'package:latest_movies_app/work/video_embed.dart';
import 'package:provider/provider.dart';

class WorkScreen2 extends StatefulWidget {
  final Movie movie;
  const WorkScreen2({Key? key, required this.movie}) : super(key: key);

  @override
  State<WorkScreen2> createState() => _WorkScreen2State();
}

class _WorkScreen2State extends State<WorkScreen2> {
  late Movie movieItem;
  @override
  void initState() {
    movieItem = widget.movie;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: Provider.of<MoviesProv>(context, listen: false)
              .getTrailer(movieId: movieItem.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // controller.dispose();

            return MetaDataa(url: (snapshot.data as String));
            //  VideoEmbed(url: (snapshot.data as String));
          }),
      //  FutureBuilder<String?>(
      //     future: Provider.of<MoviesProv>(context)
      //         .getTrailer(movieId: movieItem.id.toString()),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       print(snapshot.data);
      //       return const Center(
      //         child: VideoEmbed(
      //           "https://www.youtube.com/watch?v=5ex2C-SMwxI",
      //         ),
      //       );
      //     }),
      //     Center(
      //   child: Padding(
      //     padding: EdgeInsets.all(10),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         if (!showFrame)
      //           FutureBuilder<yt.MetaDataModel>(
      //             future: yt.YoutubeMetaData.getData(
      //               "https://www.youtube.com/watch?v=5ex2C-SMwxI",
      //             ),
      //             builder: (context, snapshot) {
      //               if (snapshot.connectionState == ConnectionState.waiting) {
      //                 return const Center(child: CircularProgressIndicator());
      //               }
      //               yt.MetaDataModel? metaData = snapshot.data;
      //               print(metaData?.type);
      //               return GestureDetector(
      //                 child: Image.network(metaData?.thumbnailUrl ?? ""),
      //                 onTap: () {
      //                   setState(() {
      //                     showFrame = true;
      //                   });
      //                 },
      //               );
      //             },
      //           ),
      //         // if (!showFrame)

      //         // if (showFrame)
      //         //   FutureBuilder(
      //         //       future: Provider.of<MoviesProv>(context, listen: false)
      //         //           .getTrailer(movieId: movieItem.id.toString()),
      //         //       builder: (context, snapshot) {
      //         //         if (snapshot.connectionState == ConnectionState.waiting) {
      //         //           return const Center(
      //         //             child: CircularProgressIndicator(),
      //         //           );
      //         //         }

      //         //         return Expanded(
      //         //           child: YoutubePlayerIFrame(
      //         //             controller: YoutubePlayerController(
      //         //               initialVideoId: 'K18cpp_-gP8',
      //         //               params: YoutubePlayerParams(
      //         //                 playlist: [
      //         //                   (snapshot.data as String)
      //         //                 ], // Defining custom playlist
      //         //                 // startAt: Duration(seconds: 30),
      //         //                 showControls: true,
      //         //                 showFullscreenButton: true,
      //         //               ),
      //         //             ),
      //         //             aspectRatio: 16 / 9,
      //         //           ),
      //         //         );
      //         //       }),
      //         ElevatedButton(
      //             onPressed: () {
      //               setState(() {
      //                 showFrame = !showFrame;
      //               });
      //             },
      //             child: Text(!showFrame ? "oynat" : "durdur")),
      //         // Text("poster image"),
      //         // Image.network(
      //         //   movieItem.posterPath ?? "",
      //         //   width: 100,
      //         //   height: 100,
      //         // ),
      //         // Text("background image"),
      //         // Image.network(
      //         //   movieItem.backdrop_path ?? "",
      //         //   width: 100,
      //         //   height: 100,
      //         // ),
      //         // Text(movieItem.title),
      //         // Text(movieItem.original_language),
      //         // Text(movieItem.release_date),
      //         // Text(movieItem.popularity.toString()),
      //         // Text(movieItem.overview.toString()),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
