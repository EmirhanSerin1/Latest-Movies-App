import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
