import 'package:cleatshop/Screens/authentication/signin.dart';
import 'package:cleatshop/Screens/authentication/signup.dart';
import 'package:cleatshop/backend/auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool Showsign = true;
  void toggle() {
    setState(() {
      Showsign = !Showsign;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Showsign) {
      return SignIn(toggle: toggle);
    } else {
      return Signup(toggle: toggle);
    }
  }
}
