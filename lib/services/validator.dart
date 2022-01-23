import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Validator{
  bool emailValidate(String email) {
    //const String email = 'fredrik.eilertsen@gail.com';
    final bool isValid = EmailValidator.validate(email);
    return isValid;
    //print('Email is valid? ' + (isValid ? 'yes' : 'no'));
  }

  Widget signUpValidator({String email='',String password='',String conPassword=''}){
      if(password.isEmpty || email.isEmpty || conPassword.isEmpty){
        print('all null');
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('Fields should not be empty',style: TextStyle(fontFamily: 'Roboto-mono',fontSize: 15,color: Colors.red.shade600),),
        );
      }
      if(!emailValidate(email)){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('Invalid email or password',style: TextStyle(fontFamily: 'Roboto-mono',fontSize: 15,color: Colors.red.shade600),),
        );
      }
      if(password.length<6){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('Password length should be more than 6',style: TextStyle(fontFamily: 'Roboto-mono',fontSize: 15,color: Colors.red.shade600),),
        );
      }
      if(password != conPassword){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('Invalid email or password',style: TextStyle(fontFamily: 'Roboto-mono',fontSize: 15,color: Colors.red.shade600),),
        );
      }
      return Text('');
  }
}