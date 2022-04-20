import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

detailsBodyBoxDecoration(PaletteColor? dominant, PaletteColor? muted) =>
    BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        tileMode: TileMode.decal,
        colors: [
          muted?.color ?? ThemeData.dark().scaffoldBackgroundColor,
          muted?.color ?? ThemeData.dark().scaffoldBackgroundColor,
          muted?.color ?? ThemeData.dark().scaffoldBackgroundColor,
          Color(0xff303030),
          Color(0xff303030),
          Color(0xff303030),
        ],
      ),
    );
