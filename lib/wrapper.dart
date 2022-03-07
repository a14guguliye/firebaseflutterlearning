import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_fire_learning/screens/authenticate/authenticate.dart';
import 'package:flutte_fire_learning/screens/authenticate/sign_in.dart';
import 'package:flutte_fire_learning/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print("user is $user");

    ///return either home or authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
