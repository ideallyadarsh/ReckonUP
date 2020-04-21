import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reckonup/Pages/edit.dart';
import 'package:reckonup/Pages/accountpage.dart';
import 'package:reckonup/Pages/addpage.dart';
import 'package:reckonup/Pages/balancepage.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page=2;
  // GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages=[
    account(),
    edit(),
    addpage(),
    balance(),

  ];

//  Widget _buildList(BuildContext context, DocumentSnapshot document) {
//    return ListTile(
//      title: Text(document['Age']),
//      subtitle: Text(document['Name']),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,//     key: _bottomNavigationKey,
        color: Colors.pinkAccent[100],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.pink[100],
        items: <Widget>[
          Icon(Icons.account_circle,size:20 ,semanticLabel: 'Account',),
          Icon(Icons.edit,size: 20,semanticLabel: 'Edit',),
          Icon(Icons.home,size: 20,semanticLabel: 'Add item',),
          Icon(Icons.account_balance_wallet,size: 20,semanticLabel: 'Balance',),
          Icon(Icons.exit_to_app,size: 20,semanticLabel: 'Exit',),
        ],
        animationDuration: Duration(milliseconds: 180),
        animationCurve: Curves.bounceInOut,
        onTap: (index){
          setState(() {
            if(index==4)
            {
              _showAlert(context);
            }
            else  {
              _page = index;
            }
          });
        },
      ),

      body: _pages[_page],
    );
  }
  void _showAlert(BuildContext context)  {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text("Exit?") ,
          content: Text("Do You want to exit the App?"),
          actions: <Widget>[
            FlatButton(child:Text("Yes"),
              onPressed: (){
                SystemNavigator.pop();
              },
            ),
            FlatButton(child:Text("No"),
              onPressed: (){
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Home()));
                });
              },
            )
          ],
        )
    );
  }
}