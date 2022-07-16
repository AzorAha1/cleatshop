import 'package:cleatshop/Screens/loading.dart';
import 'package:cleatshop/backend/auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final Function toggle;
  Signup({required this.toggle});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email = "";
  String? password = "";
  String? _error = "";
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return Loading();
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton.icon(
              onPressed: () {
                widget.toggle();
              },
              label: Text(
                "Already have an account?\nLogin",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(Icons.login),
            ),
          ],
          title: Text("Sign up"),
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
                          'Sign Up',
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
                                await _auth.Signupwithemailandpassword(
                                    email!, password!);
                            if (result == null) {
                              setState(() {
                                _error = 'Invalid Email or Password';
                                loading = false;
                              });
                            }
                          }
                          //print('email address is ${_email}');
                          //print('password is ${_password}');
                          //Navigator.pushNamed(context, '/signin');
                        }),
                  ],
                ),
              ),
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
      );
    }
  }
}
