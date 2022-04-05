import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/work/work_screen_2.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: Text("Latest Movies"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(url ??
            //     "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
            Consumer<MoviesProv>(
              builder: ((context, value, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: value.populars?.length,
                    itemBuilder: (context, index) {
                      Movie item = value.populars![index];
                      // print(item.backdrop_path);
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item.posterPath ?? ""),
                        ),
                        title: Text(item.title),
                        subtitle: Text(item.overview ?? ""),
                        trailing: Text(item.release_date),
                        onTap: () async {
                          // Movie details = await prov.getDetails(item.id);
                          // return;
                          Navigator.of(context).push(MaterialPageRoute(
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
            ElevatedButton(
              onPressed: () async {
                final response = await prov.getPopulars(pageNumber: 2);
                // print(response);
                // print(url);
              },
              child: Text("press"),
            )
          ],
        ),
      ),
    );
  }
}
