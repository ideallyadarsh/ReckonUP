import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
//import 'streambuilder_firestore.dart';
class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  Widget _buildList(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Text(document['Age']),
      subtitle: Text(document['Name']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
    if (!snapshot.hasData) {
    return Text("Loading..");
    }
    return ListView.builder(
      itemExtent: 80.0,
      itemCount: 2,
      itemBuilder: (context, index) {
        return _buildList(context, snapshot.data.documents[index]);
      },
    );
    },
      ),
    );

  }
}



//
//
//
//    body: StreamBuilder(
//      stream: Firestore.instance.collection('posts').snapshots(),
//      //print an integer every 2secs, 10 times
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return Text("Loading..");
//        }
//        return ListView.builder(
//          itemExtent: 80.0,
//          itemCount: 2,
//          itemBuilder: (context, index) {
//            return _buildList(context, snapshot.data.documents[index]);
//          },
//        );
//      },
//    ),

