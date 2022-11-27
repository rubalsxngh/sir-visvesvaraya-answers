import 'package:feynman1/profile.dart';
import 'package:feynman1/screens/home/home_screen_layout.dart';
import 'package:feynman1/screens/login_page.dart';
import 'package:feynman1/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    title: 'SIR VISVESVARAYA',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyApp(),
    routes: {
      '/login/': (context) => login_page(),
      '/main/': (context) => const HomeScreenLayout(),
      '/register/': (context) => Registration(),
      '/profile/': (context) => HomeScreen1(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        return const HomeScreenLayout();
      },
    );
  }
}
