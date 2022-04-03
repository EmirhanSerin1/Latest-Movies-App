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
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/3921000/pexels-photo-3921000.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(width: 20),
                  Image.network(
                    "https://images.pexels.com/photos/3921000/pexels-photo-3921000.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    height: 100,
                    fit: BoxFit.cover,
                    width: 100,
                  )
                ],
              ),
            ),
            Consumer<MoviesProv>(
              builder: ((context, value, child) {
                return Expanded(
                  flex: 3,
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
                final response = await prov.getPopulars(2);
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
