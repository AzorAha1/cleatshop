import 'package:cleatshop/Screens/Verify/verify.dart';
import 'package:cleatshop/Screens/authentication/signin.dart';
import 'package:cleatshop/Screens/authentication/signup.dart';
import 'package:cleatshop/Screens/home/home.dart';
import 'package:cleatshop/backend/auth.dart';
import 'package:cleatshop/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<myUser?>.value(
      catchError: ((context, error) {}),
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(),
        // routes: {
        //   '/signin':(context) => SignIn(),
        //   '/signup':(context) => Signup(),
        //   '/home':(context) => const Home(),
        // },
        home: Verify(

          
        ),
      ),
    );
  }
}
