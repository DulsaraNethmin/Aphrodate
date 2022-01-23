import 'package:aphrodate/services/auth.dart';
import 'package:aphrodate/services/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();
  Widget  errorText=Text('');
  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    Validator validator = Validator();
    final mq = MediaQuery.of(context);
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40.0,
            child: Image.asset('images/rose-red.png'),
          )),
    );
    final signupText = Row(
      children: [
        Text(
          "JOIN",
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
        controller: _emailcontroller,
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
        controller: _passwordcontroller,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );

    final inputConfirmPassword = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: _confirmpasswordcontroller,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirm Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );

    //var errorText=Text('no');

    final buttonSignup = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        minWidth: mq.size.width / 1,
        child: RaisedButton(
          child: Text('Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto-mono')),
          color: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () async => {
            setState(() {
              errorText=validator.signUpValidator(email: _emailcontroller.text,password: _passwordcontroller.text,conPassword: _confirmpasswordcontroller.text);
            }),
            if(errorText.runtimeType==Text){
              setState(()async {
                errorText=await auth.signUp(
                    email: _emailcontroller.text,
                    password: _passwordcontroller.text);
              }),
              if (FirebaseAuth.instance.currentUser != null)
                {
                  print('account create success'),
                  Navigator.pushNamed(context, '/'),
                }
              else
                {
                  setState(() {
                    _passwordcontroller.text = '';
                    _confirmpasswordcontroller.text='';
                  })
                },
            },
          },
        ),
      ),
    );
    final buttonForgotPassword = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.grey, fontSize: 16, fontFamily: 'Roboto-mono'),
            ),
            onPressed: () => {Navigator.pushNamed(context, '/')}),
      ],
    );

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                logo,
                signupText,
                inputEmail,
                inputPassword,
                inputConfirmPassword,
                errorText,
                buttonSignup,
                buttonForgotPassword
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

