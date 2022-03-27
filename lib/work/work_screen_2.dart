import 'package:flutter/material.dart';
import 'package:latest_movies_app/models/movie.dart';

class WorkScreen2 extends StatefulWidget {
  final Movie movie;
  const WorkScreen2({Key? key, required this.movie}) : super(key: key);

  @override
  State<WorkScreen2> createState() => _WorkScreen2State();
}

class _WorkScreen2State extends State<WorkScreen2> {
  @override
  Widget build(BuildContext context) {
    Movie movieItem = widget.movie;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("poster image"),
              Image.network(
                movieItem.posterPath ?? "",
                width: 100,
                height: 100,
              ),
              Text("background image"),
              Image.network(
                movieItem.backdrop_path ?? "",
                width: 100,
                height: 100,
              ),
              Text(movieItem.title),
              Text(movieItem.original_language),
              Text(movieItem.release_date),
              Text(movieItem.popularity.toString()),
              Text(movieItem.overview.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
