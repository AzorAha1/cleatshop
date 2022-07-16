import 'package:cleatshop/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  myUser? _firebaseuser(User user) {
    if (user != null) {
      return myUser(uid: user.uid);
    } else {
      return null;
    }
  }

  Stream<myUser?> get user {
    return _auth.authStateChanges().map((User? user) => _firebaseuser(user!));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print('new user Signed in');
      return _firebaseuser(user!);
    } catch (e) {
      print(e);
      print('ERROR signing in');
      return null;
    }
  }

  Future SignoutAnon() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('ERROR signing out');
    }
  }

  // ignore: non_constant_identifier_names
  Future Signupwithemailandpassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _firebaseuser(user!);
    } catch (e) {
      print(e);
    }
  }

  Future SignInwithemailandpassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _firebaseuser(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
