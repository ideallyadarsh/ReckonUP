import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('users').document(user.uid).snapshots(),
        builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('error');
          }
          if (snapshot.hasData && snapshot.data.data != null){
          switch(snapshot.connectionState){
            case ConnectionState.waiting:return Text("Loading");
            default:
              return Text(snapshot.data['name']);
          }
          };
        },
      ),
    );

  }
}
