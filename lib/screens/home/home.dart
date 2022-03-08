import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_fire_learning/screens/home/brew_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_fire_learning/services/firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutte_fire_learning/models/brew.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return StreamProvider<List<Brew?>?>.value(
      initialData: null,
      value: DataBaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text("Brew crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.person))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
