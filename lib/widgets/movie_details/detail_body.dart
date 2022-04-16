import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../models/movie.dart';
import 'background.dart';
import 'overview.dart';
import 'pop_icon.dart';
import 'poster_image_and_infos.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody(
      {Key? key,
      required this.movieItem,
      required this.muted,
      required this.dominant})
      : super(key: key);
  final Movie movieItem;
  final PaletteColor? muted;
  final PaletteColor? dominant;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.decal,
                  colors: [
                dominant?.color ?? ThemeData.dark().scaffoldBackgroundColor,
                muted?.color ?? ThemeData.dark().scaffoldBackgroundColor,
                const Color.fromARGB(73, 48, 48, 48),
                const Color.fromARGB(153, 48, 48, 48),
              ])),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Stack(
                  children: [
                    BackgroundImage(movieItem: movieItem),
                    const PopIcon(),
                    PosterImageAndOtherInfos(movieItem: movieItem),
                  ],
                ),
              ),
              OverView(text: movieItem.overview.toString())
            ],
          ),
        ),
      ),
    );
  }
}
