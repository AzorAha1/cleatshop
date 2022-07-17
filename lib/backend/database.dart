import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String? uid;
  Database({this.uid});

  final CollectionReference cleatcollection =
      FirebaseFirestore.instance.collection('cleat');

  Future newuserInfo(String name, String number, int color) async {
    return await cleatcollection.doc(uid).set({
      'name': name,
      'number': number,
      'color': color,
    });
  }
}
