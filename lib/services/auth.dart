import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {


    Future<Widget> signUp({String email='', String password='' })async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password:password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return await Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('The password provided is too weak.',style: TextStyle(fontFamily: 'Roboto-mono',fontSize: 15,color: Colors.red.shade600),),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return await Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('The account already exists for that email.',style: TextStyle(fontFamily: 'Roboto-mono',fontSize: 15,color: Colors.red.shade600),),
        );
      }
    } catch (e) {
      print(e);
      return await Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text('Error Happened',style: TextStyle(fontFamily: 'Roboto-mono',fontSize: 15,color: Colors.red.shade600),),
      );
    }
    return await Text('');
  }
}