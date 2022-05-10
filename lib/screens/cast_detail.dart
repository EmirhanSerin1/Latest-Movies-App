import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/constants/paddings/padding_cast_details.dart';
import 'package:latest_movies_app/models/cast_detail.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/widgets/movie_details/movie_details_exports.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

class CastDetails extends StatefulWidget {
  const CastDetails(
      {Key? key,
      required this.castId,
      required this.motherMovieImage,
      required this.muted})
      : super(key: key);

  final String castId;
  final String motherMovieImage;
  final PaletteColor? muted;

  @override
  State<CastDetails> createState() => _CastDetailsState();
}

class _CastDetailsState extends State<CastDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CastDetail?>(
        future: Provider.of<MoviesProv>(context)
            .getCastDetails(castId: widget.castId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          CastDetail? credit = snapshot.data;
          if (credit == null) {
            return const Center(child: Text("not found"));
          }
          return ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.muted?.color ??
                          ThemeData.dark().scaffoldBackgroundColor,
                      widget.muted?.color ??
                          ThemeData.dark().scaffoldBackgroundColor,
                      const Color(0xff303030),
                    ],
                  ),
                ),
                height: 300,
                child: Stack(
                  children: [
                    Image.network(widget.motherMovieImage),
                    const PopIcon(),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500" +
                                      credit.profilePath.toString()),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ...credit.alsoKnownAs!
              //     .map(
              //       (e) => Text(e.toString()),
              //     )
              //     .toList(),
              // Text(credit.id.toString()),
              // Text(credit.birthday.toString()),
              // Text(credit.deathday.toString()),
              Padding(
                padding: PaddingCastDetails.horizontalPadding +
                    const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    credit.gender == 2
                        ? const Icon(Icons.male, color: Colors.blue)
                        :  Icon(Icons.female, color: Colors.pink.shade400),
                    Text(credit.placeOfBirth.toString()),
                  ],
                ),
              ),

              // Gender 1 Kadın, 2 Erkek.
              // Text(credit.imdbId.toString()),
              Padding(
                padding: PaddingCastDetails.horizontalPadding +
                    const EdgeInsets.symmetric(vertical: 20),
                child: Text(credit.biography.toString()),
              ),
              // Text(credit.homepage.toString()),
            ],
          );
        },
      ),
    );
  }
}
