
import 'package:firebase_connection/Auth.dart';
import 'package:firebase_connection/firestoreData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: app(),
  ));
}
// ignore: camel_case_types
class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else {
          return AuthenticateUser();
        }
      },
    );
  }
}
// Authenticate
// ignore: must_be_immutable
class AuthenticateUser extends StatelessWidget {
 authenticate _auth = new authenticate(mail: "akshat@gmail.com", pass: "123pass");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("Authenticate")),
      body: Container(
        child: Center(
          child: Row(
            children: [
              Container(
                color: Colors.redAccent,
                height: 30,
                child: GestureDetector(
                child: Text("Sign in anon"),
                  onTap: (){
                  _auth.signInAnonymously();
                  Navigator.push(context, MaterialPageRoute(builder: (s){
                    return cloudStorageStaticChange();
                  }));
                  },
               ),
            ),
              SizedBox(height: 20,),
              Container(
                color: Colors.redAccent,
                height: 30,
                child: GestureDetector(
                  child: Text("Sign in with google"),
                  onTap: (){
                    _auth.signInWithEmailAndPassword();
                    Navigator.push(context, MaterialPageRoute(builder: (s){
                      return cloudStorageStaticChange();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ignore: camel_case_types
class cloudStorageStaticChange extends StatefulWidget {
  @override
  _cloudStorageStaticChangeState createState() => _cloudStorageStaticChangeState();
}

// FireStore
// ignore: camel_case_types
class _cloudStorageStaticChangeState extends State<cloudStorageStaticChange> {
  TextEditingController _contForEmail = new TextEditingController();
  TextEditingController _contForName = new TextEditingController();
  TextEditingController _contForTitle = new TextEditingController();
  firestoreDataDelayChnge _fd = new firestoreDataDelayChnge();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          TextField(
            controller: _contForEmail,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          SizedBox(height: 10,),
          TextField(
          controller: _contForName,
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          SizedBox(height: 10,),
          TextField(
          controller: _contForTitle,
            decoration: InputDecoration(
            hintText: "title ",
          ),
          ),
          SizedBox(height: 10,),
          FlatButton(
            child: Center(
              child: Text("Click To add User"),
            ),
            onPressed: (){
              _fd.addUser(_contForEmail.text, _contForName.text, _contForTitle.text);
              Navigator.push(context, MaterialPageRoute(builder: (e) => RealTimeData()));
            },
          )
        ],
      ),
    );
  }
}
class RealTimeData extends StatefulWidget {
  @override
  _RealTimeDataState createState() => _RealTimeDataState();
}

class _RealTimeDataState extends State<RealTimeData> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
