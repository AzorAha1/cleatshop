import 'package:cleatshop/Screens/authentication/authentication.dart';
import 'package:cleatshop/Screens/home/home.dart';
import 'package:cleatshop/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Verify extends StatefulWidget {
  Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<myUser?>(context);
    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
 