import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class authenticate{
  String mail, pass;
  FirebaseAuth _auth;
  authenticate({@required this.mail, @required this.pass}){
     _auth = FirebaseAuth.instance;
  }

  Future<UserCredential> signInAnonymously() async {
       try{
         return await _auth.signInAnonymously();
       }catch(e){
         return e;
       }
  }

  Future<UserCredential> signInWithEmailAndPassword() async {
    try{
      return await _auth.signInWithEmailAndPassword(
        email: this.mail, password: this.pass
      );
    }catch(e){
      return e;
    }
  }

}