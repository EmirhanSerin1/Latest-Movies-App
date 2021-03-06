import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:latest_movies_app/providers/auth.dart';
import 'package:latest_movies_app/providers/favorites_prov.dart';
import 'package:latest_movies_app/providers/movies_prov.dart';
import 'package:latest_movies_app/screens/home_screen.dart';
import 'package:latest_movies_app/work/login/login_screen.dart';
import 'package:latest_movies_app/work/work_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(
          create: (context) => Favorites(),
        ),
      ],
      child: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return MaterialApp(
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.dark,

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData ||
                      FirebaseAuth.instance.currentUser != null) {
                    return const WorkScreen();
                  } else {
                    return const LoginScreen();
                  }
                },
              ),
              // home: const WorkScreen(),

              // * Providerlar?? burada test ediyorum ??sttekini yorumdan ????kart.
              // home: const WorkScreen(),
            );
          }),
    );
  }
}
