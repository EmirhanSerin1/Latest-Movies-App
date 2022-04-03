import 'package:flutter/material.dart';
import 'package:latest_movies_app/screens/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const CustomDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 12,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) => Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed:
                              ()=> Scaffold.of(context).openDrawer(),
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("Latest Movies",
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
