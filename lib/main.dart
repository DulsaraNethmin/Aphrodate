import 'package:aphrodate/screens/editProfile.dart';
import 'package:aphrodate/screens/home.dart';
import 'package:aphrodate/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //'/': (context) => OpenScreen(),
       '/': (context) => LoginPage(),
        '/signup':(context)=>SignupPage(),
        '/home':(context)=>HomeScreen(),
        '/editProfile':(context)=>EditProfile(),
      },
    );
  }
}