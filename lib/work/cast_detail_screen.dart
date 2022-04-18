import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/cast_detail.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:provider/provider.dart';

class CastDetailsScreen extends StatefulWidget {
  final String castId;
  const CastDetailsScreen({Key? key, required this.castId}) : super(key: key);

  @override
  State<CastDetailsScreen> createState() => _CastDetailsScreenState();
}

class _CastDetailsScreenState extends State<CastDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CastDetail?>(
          future: Provider.of<MoviesProv>(context)
              .getCastDetails(castId: widget.castId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            CastDetail? credit = snapshot.data;
            if (credit == null) {
              return Center(child: Text("not found"));
            }
            return ListView(
              children: [
                Image.network("https://image.tmdb.org/t/p/w500" +
                    credit.profilePath.toString()),
                // Text(credit.alsoKnownAs.toString()),
                ...credit.alsoKnownAs!
                    .map(
                      (e) => Text(e.toString()),
                    )
                    .toList(),
                Text(credit.id.toString()),
                Text(credit.birthday.toString()),
                Text(credit.deathday.toString()),
                Text(credit.gender.toString()),
                Text(credit.imdbId.toString()),
                Text(credit.biography.toString()),
                Text(credit.homepage.toString()),
                Text(credit.placeOfBirth.toString()),
                Text(credit.placeOfBirth.toString()),

                // Text(credit.media.),
              ],
            );
          }),
    );
  }
}
