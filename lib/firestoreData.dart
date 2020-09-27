
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class firestoreDataDelayChnge{
  String email, Name, title;
  FirebaseFirestore firebaseFirestore;
  CollectionReference reference;
  firestoreDataDelayChnge(){
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    reference = firebaseFirestore.collection("students");
  }

   Future<void> addUser(String email,String Name, String title) {
     reference.add({ // reference to the collection
       "Email" : email,
       "Name" : Name,
       "title" : title
     }).then((value) => print("$value was added ")).catchError((){print("Error adding user");});
   }
   Future<Widget> getData(BuildContext context, String documentId) async{
     return FutureBuilder<DocumentSnapshot>(
         future: reference.doc(documentId).get(),
         builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
           if (snapshot.hasError){
             return Center(child:  CircularProgressIndicator(),);
           }
           if(snapshot.connectionState == ConnectionState.done){
             Map<String, dynamic> dta = snapshot.data.data();
             return Center(child: Text("Name => ${dta['Name']}, Email => ${dta['Email']}, title => ${dta['title']} "),);
     }
           return Text('Loading');
           }
     );
   }
}