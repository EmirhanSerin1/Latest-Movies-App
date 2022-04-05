import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/work/work_screen_2.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({Key? key}) : super(key: key);

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  String? url;
  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);

    return Scaffold(
      floatingActionButton: Consumer<MoviesProv>(
        builder: (context, value, child) => FloatingActionButton(
          onPressed: () async {
            value.currentPageNumber;
            if (value.currentPageNumber < (prov.totalLatestPages as num)) {
              value.currentPageNumber++;
            } else {
              value.currentPageNumber = 1;
            }

            await prov.getLatestMovies(pageNumber: value.currentPageNumber);
          },
          child: Text(value.currentPageNumber.toString() +
              "/" +
              value.totalLatestPages.toString()),
        ),
      ),
      appBar: AppBar(
        title: Text("Latest Movies"),
      ),
      body: FutureBuilder(
        future: prov.getLatestMovies(pageNumber: 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<MoviesProv>(
                  builder: ((context, value, child) {
                    return Expanded(
                      child: value.latestMovies!.isEmpty
                          ? const Center(
                              child: Text("Sonuc Bulunamadi"),
                            )
                          : ListView.builder(
                              itemCount: value.latestMovies?.length,
                              itemBuilder: (context, index) {
                                Movie item = value.latestMovies![index];
                                // print(item.backdrop_path);
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(item.posterPath ?? ""),
                                  ),
                                  title: Text(item.title),
                                  subtitle: Text(
                                      item.overview ?? "Overview not found"),
                                  trailing: Text(item.release_date),
                                  onTap: () async {
                                    // Movie details = await prov.getDetails(item.id);
                                    // return;
                                    // await prov.getTrailer(
                                    //   movieId: item.id.toString(),
                                    // );
                                    // return;
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return WorkScreen2(movie: item);
                                      },
                                    ));
                                    // print(details.posterPath ?? "null");
                                  },
                                );
                              },
                            ),
                    );
                  }),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     if (pageNumber < (prov.totalLatestPages as num)) {
                //       pageNumber++;
                //     } else {
                //       pageNumber = 1;
                //     }
                //     print(prov.totalLatestPages);
                //     print(pageNumber);

                //     await prov.getLatestMovies(pageNumber: pageNumber);
                //   },
                //   child: Text("Next Page"),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
