import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

detailsBodyBoxDecoration(PaletteColor? dominant,muted) => BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.decal,
              colors: [
                dominant?.color ?? ThemeData.dark().scaffoldBackgroundColor,
                muted?.color ?? ThemeData.dark().scaffoldBackgroundColor,
                const Color.fromARGB(73, 48, 48, 48),
                const Color.fromARGB(153, 48, 48, 48),
              ],
            ),
          );