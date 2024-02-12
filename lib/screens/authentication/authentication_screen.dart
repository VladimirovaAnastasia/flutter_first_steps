import 'package:flutter/material.dart';

enum Profession { designer, developer, manager }

class HomeScreenArguments {
  final String userName;
  final Profession profession;

  HomeScreenArguments(this.userName, this.profession);
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _formSignInKey = GlobalKey<FormState>();

  String userName = '';
  Profession? profession;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthenticationScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        // This is called when the user selects an item.
                        setState(() {
                          userName = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: const Text('Name'),
                        hintText: 'Enter Name',
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
                    const SizedBox(
                      height: 25.0,
                    ),
                    DropdownButton<Profession>(
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        width: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      isExpanded: true,
                      onChanged: (Profession? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          profession = value!;
                        });
                      },
                      value: profession,
                      items: Profession.values
                          .map<DropdownMenuItem<Profession>>(
                              (Profession value) {
                        return DropdownMenuItem<Profession>(
                          value: value,
                          child: Text(value.name.toString()),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formSignInKey.currentState!.validate() &&
                              (profession != null)) {
                            Navigator.pushNamed(context, '/home',
                                arguments: HomeScreenArguments(
                                  userName,
                                  profession!,
                                ) // arguments - dynamic
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please fill data')),
                            );
                          }
                        },
                        child: const Text('Authenticate'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
