import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:latest_movies_app/widgets/drawer/log_out_alert_dialog.dart';
import 'package:latest_movies_app/work/add_remove_listButton.dart';
import 'package:latest_movies_app/work/listof_userLists.dart';
import 'package:latest_movies_app/work/work_screen_2.dart';
import '../models/cast.dart';
import '../models/movie.dart';
import '../providers/favorites_prov.dart';
import '../providers/movies_prov.dart';
import 'cast_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({Key? key}) : super(key: key);

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  String? url;
  @override
  Widget build(BuildContext context) {
    MoviesProv moviesProv = Provider.of<MoviesProv>(context, listen: false);
    Favorites fav_prov = Provider.of<Favorites>(context, listen: false);

    return Scaffold(
      // floatingActionButton: AddRemoveListButton(),
      appBar: AppBar(
        title: Text("Latest Movies"),
      ),
      body: FutureBuilder(
        future: moviesProv.getLatestMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          List<Movie>? films = moviesProv.latestMovies;
          return ListView.builder(
            itemCount: films!.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () async {
                print(1);
                await fav_prov.addToList(
                  "9SAYUXBXMKPz28AqiR8u",
                  films[index].id.toString(),
                  films[index].title,
                  films[index].posterPath ?? "",
                  films[index].backdrop_path ?? "",
                  films[index].release_date,
                );
                print(23);
                //   await showDialog(
                //       context: context,
                //       builder: (context) {
                //         return ListOfUserLists();
                //       });
              },
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(films[index].posterPath as String),
              ),
              title: Text(films[index].title),
              trailing: Text(films[index].id.toString()),
            ),
          );
        },
      ),
    );
  }
}
