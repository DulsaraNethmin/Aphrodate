import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 56.0,
            child: Image.asset('images/rose-red.png'),
          )),
    );
    final loginText = Row(
      children: [
        Text(
          "LOGIN",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa-Bold',
              fontSize: 36,
              letterSpacing: 2.0),
        )
      ],
    );
    final inputEmail = Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
    final inputPassword = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
    final buttonLogin = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto-mono')),
          color: Colors.black87,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () => {},
        ),
      ),
    );
    final buttonForgotPassword = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            child: Text(
              'Join',
              style: TextStyle(
                  color: Colors.grey, fontSize: 16, fontFamily: 'Roboto-mono'),
            ),
            onPressed: () => {Navigator.pushNamed(context, '/signup')}),
        TextButton(
            child: Text(
              'Forgot Password',
              style: TextStyle(
                  color: Colors.grey, fontSize: 16, fontFamily: 'Roboto-mono'),
            ),
            onPressed: null),
      ],
    );

    return SafeArea(
        child: Scaffold(
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                logo,
                loginText,
                inputEmail,
                inputPassword,
                buttonLogin,
                buttonForgotPassword
              ],
            ),
          ),
        ));
  }
}
