import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/components/custom_text.dart';
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
    return FutureBuilder(
      future: Provider.of<MoviesProv>(context, listen: false)
          .getTrailer(movieId: id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          constraints: const BoxConstraints(maxWidth: 350),
          margin: PaddingMovieDetails.generalPadding +
              const EdgeInsets.only(top: 40, bottom: 40),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Trailer",
                textStyle: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10),
              VideoEmbed(url: (snapshot.data as String))
            ],
          ),
        );
      },
    );
  }
}
