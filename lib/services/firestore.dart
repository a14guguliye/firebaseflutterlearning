import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_fire_learning/models/brew.dart';

class DataBaseService {
  final String? uid;
  final brewCollectionReference =
      FirebaseFirestore.instance.collection('brews');

  DataBaseService({this.uid});

  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollectionReference
        .doc(uid)
        .set({'sugars': sugar, 'name': name, 'strength': strength});
  }

  List<Brew?>? _brewListfromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((e) {
        return Brew(
          name: e['name']?.toString(),
          sugar: e['sugars']?.toString(),
          strength: e['strength'],
        );
      }).toList();
    } catch (e) {
      return null;
    }
  }

  Stream<List<Brew?>?>? get brews {
    try {
      return brewCollectionReference
          .snapshots()
          .map((snapshot) => _brewListfromSnapshot(snapshot));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
