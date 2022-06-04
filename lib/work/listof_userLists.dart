import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOfUserLists extends StatelessWidget {
  const ListOfUserLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("lists").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = (snapshot.data as QuerySnapshot);

        List<QueryDocumentSnapshot> docs = data.docs;
        print(docs.length);
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: docs
                .map((e) => ListTile(
                      title: Text(e["name"]),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ))
                .toList(),
          ),
        );
        // Container(
        //   height: 100,
        //   width: 100,
        //   child: ListView.builder(
        //     itemCount: docs.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text("123"),
        //       );
        //     },
        //   ),
        // );
      },
    );
  }
}
