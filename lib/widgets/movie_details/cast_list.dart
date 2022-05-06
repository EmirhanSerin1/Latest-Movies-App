import 'package:flutter/material.dart';
import 'package:latest_movies_app/core/components/page_route.dart';
import 'package:latest_movies_app/core/constants/box_properties/box_prop_movie_details.dart';
import 'package:latest_movies_app/core/constants/paddings/paddings_movie_details.dart';
import 'package:latest_movies_app/models/cast.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/screens/cast_detail.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

class CastList extends StatelessWidget {
  const CastList(
      {Key? key,
      required this.id,
      required this.motherMovieImage,
      required this.muted})
      : super(key: key);

  final String id;
  final String motherMovieImage;
  final PaletteColor? muted;

  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);

    return SizedBox(
      height: 130,
      child: FutureBuilder(
        future: Provider.of<MoviesProv>(context, listen: false)
            .getCastandDetails(id),
        builder: (context, snapshot) {
          List<Cast> casts = prov.casts ?? [];

          if (snapshot.connectionState == ConnectionState.waiting) {
            return RepaintBoundary(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: PaddingMovieDetails.allEight / 2,
                        child: SizedBox(
                            width: MovieDetailsBoxProperties.castWidth,
                            height: MovieDetailsBoxProperties.castHeight,
                            child: const Center(
                              child: RepaintBoundary(
                                child: CircularProgressIndicator(),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MovieDetailsBoxProperties.castWidth,
                        child: Text(
                          "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 5,
              ),
            );
          } else {
            return RepaintBoundary(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(createRoute(
                            CastDetails(
                              castId: casts[index].id.toString(),
                              motherMovieImage: motherMovieImage,
                              muted: muted,
                            ),
                            x: 1,
                            y: 1)),
                        child: Padding(
                          padding: PaddingMovieDetails.allEight / 2,
                          child: SizedBox(
                            width: MovieDetailsBoxProperties.castWidth,
                            height: MovieDetailsBoxProperties.castHeight,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                casts[index].profilePath != null
                                    ? "https://image.tmdb.org/t/p/w500" +
                                        (casts[index].profilePath!)
                                    : "https://i0.wp.com/1.bp.blogspot.com/_saHCz6YS_o0/S2gmYeLBmXI/AAAAAAAAAds/XeUYqR1QWAY/s320/unknown-person.gif?zoom=2",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: PaddingMovieDetails.allEight / 2,
                        child: SizedBox(
                          width: MovieDetailsBoxProperties.castWidth,
                          child: Text(casts[index].name ?? "",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: casts.length,
              ),
            );
          }
        },
      ),
    );
  }
}
