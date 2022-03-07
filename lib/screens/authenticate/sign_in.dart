import 'package:flutte_fire_learning/screens/authenticate/test.dart';
import 'package:flutte_fire_learning/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({required this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Test();
                  }),
                );
              },
              icon: const Icon(Icons.access_alarms)),
          IconButton(
              onPressed: () {
                widget.toggleView();
              },
              icon: const Icon(Icons.person))
        ],
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("Sign in to Brew crew"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  email = val;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  password = val;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  child: const Text("Sign in"))
            ],
          ),
        ),
      ),
    );
  }
}
