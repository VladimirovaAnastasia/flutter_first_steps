import 'package:flutter/material.dart';

import '../authentication/authentication_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as HomeScreenArguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello ${args.userName}!'),
            const SizedBox(height: 25),
            Text('I know you are ${args.profession.name}!'),
          ],
        )));
  }
}
