import 'package:cleatshop/Screens/loading.dart';
import 'package:cleatshop/backend/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return Loading();
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.logout),
              label: Text("Log out "),
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                await Future.delayed(Duration(seconds: 2));
                await _auth.SignoutAnon();
                
                setState(() {
                  loading = false;
                });
              },
            ),
          ],
          title: Text("Home"),
        ),
      );
    }
  }
}
