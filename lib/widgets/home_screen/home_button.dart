import 'package:flutter/material.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:provider/provider.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MoviesProv provider = Provider.of<MoviesProv>(context, listen: false);
    return ElevatedButton(
      onPressed: () async {
        // await provider.getPopulars();
      },
      child: Text("home"),
    );
  }
}
