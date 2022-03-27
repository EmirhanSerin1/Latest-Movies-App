import 'package:flutter/material.dart';
import 'package:latest_movies_app/widgets/home_screen/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest Movies"),
      ),
      body: Center(
        child: HomeButton(),
      ),
    );
  }
}
