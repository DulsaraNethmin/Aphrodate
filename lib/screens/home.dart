import 'package:aphrodate/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Auth auth =Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: ElevatedButton(
        child: Text('logout'),
        onPressed: (){
          print('log out');
          auth.signout();
          Navigator.pushNamed(context, '/');
        },
      ),
    ),);
  }
}
