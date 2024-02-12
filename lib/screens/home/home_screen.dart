import 'package:flutter/material.dart';

import '../authentication/authentication_screen.dart';
import '../overlay/overlay_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.userName, required this.profession});

  final String userName;
  final Profession profession;

  OverlayEntry? overlayEntry;

  void createHighlightOverlay(BuildContext context,
      {required String overlayContent}) {
    overlayEntry = OverlayEntry(
      // Create a new OverlayEntry.
      builder: (BuildContext context) {
        // Align is used to position the highlight overlay
        // relative to the NavigationBar destination.
        return Positioned(
            top: 150,
            height: 150,
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.amberAccent,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Content: $overlayContent',
                          style: const TextStyle(height: 5, fontSize: 15)),
                      ElevatedButton(
                        onPressed: () {
                          removeHighlightOverlay();
                        },
                        child: const Text('Remove Overlay'),
                      )
                    ])));
      },
    );

    // Add the OverlayEntry to the Overlay.
    Overlay.of(context).insert(overlayEntry!);
  }

  // Remove the OverlayEntry.
  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello $userName!'),
            const SizedBox(height: 16),
            Text('I know you are ${profession.name}!'),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () async {
                  final String overlayContent = await Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => const OverlayContentPage()));
                  createHighlightOverlay(context,
                      overlayContent: overlayContent);
                },
                child: const Text('Enter Overlay Content'))
          ],
        )));
  }
}
