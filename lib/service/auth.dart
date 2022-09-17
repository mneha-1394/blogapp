import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future signIncreat(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
     late User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'Password is to weak!!!', backgroundColor: Colors.black);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account is already signed in ',
            backgroundColor: Colors.black);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
   
}
