import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_fire_learning/models/brew.dart';
import 'package:flutte_fire_learning/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew?>?>(context);
    if (brews != null) {
      print("brew length is " + brews.length.toString());
    } else {
      print("brew is null mate");
    }
    return ListView.builder(
        itemCount: brews?.length ?? 0,
        itemBuilder: (context, index) {
          return BrewTile(brew: brews?[index]);
        });
  }
}
