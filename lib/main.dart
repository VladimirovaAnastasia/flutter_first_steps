import 'package:flutter/material.dart';
import 'package:flutter_first_steps/screens/authentication/authentication_screen.dart';
import 'package:flutter_first_steps/screens/home/home_screen.dart';
import 'package:flutter_first_steps/screens/intro/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const IntroPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/authentication': (context) => const AuthenticationPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
