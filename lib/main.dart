import 'package:flutter/material.dart';
import 'package:latest_movies_app/providers/auth.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/screens/home_screen.dart';
import 'package:latest_movies_app/work/work_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesProv(),
        ),
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          
        ),
        home: const HomeScreen(),

        // * Providerları burada test ediyorum üsttekini yorumdan çıkart.
        // home: const WorkScreen(),
      ),
    );
  }
}
