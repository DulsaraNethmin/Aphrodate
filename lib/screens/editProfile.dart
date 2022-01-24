import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      leading: Image.asset(
        'images/edit.png',
        scale: 3,
      ),
      title: Text(
        'Edit Profile',
        style: TextStyle(
            fontFamily: 'Roboto-mono', fontSize: 25, color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
    return Scaffold(
      appBar: topAppBar,
      body: SafeArea(
        child: Text('edit profile'),
      ),
    );
  }
}
