import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:latest_movies_app/providers/auth.dart';
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
      ],
      child: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
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
                    return const HomeScreen();
                  } else {
                    return const LoginScreen();
                  }
                },
              ),
              // home: const WorkScreen(),

              // * Providerları burada test ediyorum üsttekini yorumdan çıkart.
              // home: const WorkScreen(),
            );
          }),
    );
  }
}
