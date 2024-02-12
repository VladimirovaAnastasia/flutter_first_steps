import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IntroScreen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello'),
            const SizedBox(height: 25),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/authentication');
                },
                child: const Text('Go Authentication'))
          ],
        )));
  }
}
