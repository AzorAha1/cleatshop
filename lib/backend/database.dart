import 'package:cleatshop/models/cleat.dart';
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

  List<Cleat> _cleatlistforQuerySnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Cleat(
        name: e.get('name')??'',
        color: e.get('color')?? 0,
        number: e.get('number')?? '',
      );
    }).toList();
  }

  Stream<List<Cleat>> get cleats {
    return cleatcollection.snapshots().map(((QuerySnapshot snapshot) => _cleatlistforQuerySnapshots(snapshot) ));
  }
}
