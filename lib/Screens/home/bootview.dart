import 'package:cleatshop/models/cleat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cleatshop/backend/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bootview extends StatefulWidget {
  Bootview({Key? key}) : super(key: key);

  @override
  State<Bootview> createState() => _BootviewState();
}

class _BootviewState extends State<Bootview> {
  @override
  Widget build(BuildContext context) {
    final _cleat = Provider.of<List<Cleat>>(context);
    _cleat.forEach(((element) {
      print(element.name);
      print(element.number);
      print(element.color);
    }));
    return Container();
  }
}
