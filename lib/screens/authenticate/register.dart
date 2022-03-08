import 'package:flutte_fire_learning/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutte_fire_learning/screens/authenticate/test.dart';
import 'package:flutte_fire_learning/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? email;
  String? password;
  final _formkey = GlobalKey<FormState>();
  String error = '';
  AuthService _auth = AuthService();
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
                          return const Test();
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
                      validator: (value) {
                        return value == null || value.isEmpty
                            ? "null value is not allowed"
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
                      validator: (value) {
                        return value == null || value.isEmpty
                            ? "null value is not allowed"
                            : value.length < 6
                                ? "password length is less than 6"
                                : null;
                      },
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
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signUpWithEmailandPassword(email!, password!);

                            print("result is $result");
                            if (result == null) {
                              setState(() {
                                error = "error in registering";
                                loading = false;
                              });
                            } else {
                              setState(() {
                                error = "";
                              });
                            }
                          }
                        },
                        child: const Text("Register")),
                    const SizedBox(
                      height: 10,
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
