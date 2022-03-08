import 'package:flutter/material.dart';
import 'package:flutte_fire_learning/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew? brew;

  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew?.strength ?? 100],
          ),
          title: Text(brew!.name!),
          subtitle: Text("required sugar is " + brew!.sugar!),
        ),
      ),
    );
  }
}
