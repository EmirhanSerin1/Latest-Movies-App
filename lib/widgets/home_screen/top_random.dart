import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:provider/provider.dart';

class HomeRandomMovie extends StatelessWidget {
  const HomeRandomMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);

    return RepaintBoundary(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: prov.getLatestMovies(),
            builder: (context, snapshot) {
              return Consumer<MoviesProv>(
                builder: (context, value, child) {
                  if (snapshot.hasData) {
                    return RepaintBoundary(child: const SizedBox());
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    Movie item = value.latestMovies![2];
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 20,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              item.backdrop_path.toString(),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          child: SizedBox(
                            height: 280,
                            child: AspectRatio(
                              aspectRatio: 7 / 10.2,
                              child: Image.network(
                                item.posterPath.toString(),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.grey.shade700.withOpacity(0.8),
                            height: 100,
                            width: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title.toString()),
                                Expanded(
                                  child: Text(
                                    item.overview.toString(),
                                    style: Theme.of(context).textTheme.caption,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
