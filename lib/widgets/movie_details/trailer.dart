import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/components/custom_text.dart';
import 'package:latest_movies_app/core/constants/box_properties/box_prop_movie_details.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';
import 'package:latest_movies_app/work/video/video_embed.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../providers/movies_prov.dart';

class Trailer extends StatelessWidget {
  const Trailer({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Hero(
            tag: "special",
            child: Material(
              color: Colors.transparent,
              child: FutureBuilder(
                future: Provider.of<MoviesProv>(context, listen: false)
                    .getTrailer(movieId: id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: PaddingMovieDetails.horizontalPadding,
                        child:
                            SizedBox(child: Image.asset("assets/youtube.png")),
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Padding(
                      padding: PaddingMovieDetails.horizontalPadding,
                      child: SizedBox(
                        child: VideoEmbed(url: (snapshot.data as String)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
