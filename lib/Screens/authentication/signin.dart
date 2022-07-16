import 'package:cleatshop/backend/auth.dart';
import 'package:flutter/material.dart';
import 'package:cleatshop/Screens/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggle;

  SignIn({required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email = '';
  String? password = '';
  String? _error = "";
  bool loading = false;
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return const Loading();
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton.icon(
              //color: Colors.black26,
              onPressed: (() {
                widget.toggle();
              }),
              icon: Icon(Icons.account_box),
              label: Text(
                "Create an Account",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
          title: Text("Boot Store"),
          //centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email'),
                        onChanged: ((value) => setState(() {
                              email = value;
                            })),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 12) {
                            return 'Password has to be 12+ chars';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Password',
                        ),
                        obscureText: true,
                        onChanged: (value) => setState(() {
                          password = value;
                        }),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton(
                        color: Colors.blue,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.SignInwithemailandpassword(
                                    email!, password!);
                            if (result == null) {
                              setState(() {
                                _error = "Account Doesn't Exist";
                                loading = false;
                              });
                            }
                          }
                          //print('email address is ${_email}');
                          //print('password is ${_password}');
                          //Navigator.pushNamed(context, '/signin');
                        }),
                    SizedBox(
                      child: Text(
                        _error!,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
