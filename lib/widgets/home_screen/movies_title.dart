import 'package:flutter/material.dart';

class MoviesTitle extends StatelessWidget {
  const MoviesTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}