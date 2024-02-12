import 'package:flutter/material.dart';

class OverlayContentPage extends StatefulWidget {
  const OverlayContentPage({super.key});

  @override
  State<OverlayContentPage> createState() => _OverlayContentPageState();
}

class _OverlayContentPageState extends State<OverlayContentPage> {
  final _formOverlayKey = GlobalKey<FormState>();

  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OverlayContentScreen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formOverlayKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter something';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          // This is called when the user selects an item.
                          setState(() {
                            content = value;
                          });
                        },
                        decoration: InputDecoration(
                          label: const Text('Content'),
                          hintText: 'Enter Something',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                          onPressed: () {
                            if (_formOverlayKey.currentState!.validate()) {
                              Navigator.of(context).pop(content);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please fill data')),
                              );
                            }
                          },
                          child: const Text('Go back'))
                    ],
                  )),
            ),
          ],
        )));
  }
}
