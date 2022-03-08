import 'package:flutte_fire_learning/screens/authenticate/test.dart';
import 'package:flutte_fire_learning/services/auth.dart';
import 'package:flutte_fire_learning/shared/loading.dart';
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
  final _formkey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
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
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val == null || val == ''
                            ? "Empty email field is not allowed"
                            : null;
                      },
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        return value == null
                            ? "Empty passwors are not allowed"
                            : value.length < 6
                                ? "password values can not be less than 6"
                                : null;
                      },
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
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            await Future.delayed(const Duration(seconds: 2));
                            dynamic result = await _auth
                                .signInWithEmailandPassword(email!, password!);

                            if (result == null) {
                              setState(() {
                                error = "wrong credentials";
                                loading = false;
                              });
                            }
                          }
                        },
                        child: const Text("Sign in")),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      error,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
