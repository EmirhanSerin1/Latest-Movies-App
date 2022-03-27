import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/home_screen/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomeButton(),
      ),
    );
  }
}
