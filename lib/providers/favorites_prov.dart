import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favorites extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createList(String listName, String uid) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("lists")
        .where("name", isEqualTo: listName)
        .where("uid", isEqualTo: uid)
        .get();

    List<DocumentSnapshot> docs = snapshot.docs;
    if (docs.isEmpty) {
      await FirebaseFirestore.instance.collection("lists").add({
        "name": listName,
        "date": DateTime.now(),
        "movies": [],
        "uid": uid,
      });
    }
  }

  Future<void> deleteList(String id) async {
    await FirebaseFirestore.instance.collection("lists").doc(id).delete();
  }

  Future<void> addToList(
    String listId,
    String movieId,
    String name,
    String imagePath,
    String posterPath,
    String releaseDate,
  ) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("listedMovies")
        .where("listId", isEqualTo: listId)
        .where("movieId", isEqualTo: movieId)
        .get();

    List<DocumentSnapshot> docs = snapshot.docs;
    if (docs.isEmpty) {
      await FirebaseFirestore.instance.collection("listedMovies").add({
        "listId": listId,
        "movieId": movieId,
        "name": name,
        "imagePath": imagePath,
        "posterPath": posterPath,
        "releaseDate": releaseDate,
        "added_date": DateTime.now(),
      });
    }
  }

  Future<void> removeFromList(String listId, String movieId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("listedMovies")
        .where("listId", isEqualTo: listId)
        .where("movieId", isEqualTo: movieId)
        .get();

    List<DocumentSnapshot> docs = snapshot.docs;

    for (var item in docs) {
      await FirebaseFirestore.instance
          .collection("listedMovies")
          .doc(item.id)
          .delete();
    }
  }

  Future<void> getMoviesInTheList(String listId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("lists")
        .where("listId", isEqualTo: listId)
        .get();

    List<DocumentSnapshot> docs = snapshot.docs;
    print(docs.length);
  }
}
