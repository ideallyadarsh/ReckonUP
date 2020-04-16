import 'package:flutter/material.dart';
import 'home.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/main',
  routes: {
    '/main':(context)=>Main(),
//    '/next':(context)=>Home(),
  },
));

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
//        '/main':(context)=>Main(),
        '/next':(context)=>Home(),
      },
      title: "login",
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Myloginpage(title: 'login form'),
    );
  }
}

class Myloginpage extends StatefulWidget {
  Myloginpage({Key key, this.title}):super(key:key);
  final String title;
//  BaseAuth _auth;
//  final BaseAuth auth;
  @override
  _MyloginpageState createState () => _MyloginpageState();
//  Widget build(BuildContext context) {
//    return Container();
//  }
}

class _MyloginpageState extends State<Myloginpage>{

  final formkey = GlobalKey<FormState>();
  String _email,_password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("login"),
      ),
      body: Center(
        child: Form(

          key: formkey,
          child: Column(
            children: <Widget>[
              TextFormField(

                validator: (input) => !input.contains('@') ? 'Not valid email':null,
                onSaved: (input) => _email=input,

                decoration: InputDecoration(
                    labelText: 'Enter your email:'
                ),
              ),
              TextFormField(
                obscureText: true,
                onSaved: (value) => _password=value,
                validator: (input) => input.isEmpty ? 'cant not be empty':null,
                decoration: InputDecoration(
                    labelText: 'Enter your password:'
                ),
              ),
              FlatButton(
                child: Text("LOGIN"),
                onPressed: _sumbit,
              ),
            ],
          ),
        ),
      ),

    );
  }
  

  void _sumbit() async {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      AuthResult user1 = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);

      if(user1.user.uid != null){
        Navigator.pushNamed(context, '/next');
        print("i arrived");
      }





    }
  }
}



//
//() async {
//String user = u;
//String pass = p;
//AuthResult user1 = await FirebaseAuth.instance.signInWithEmailAndPassword(email: u, password: p);
//String h = user1.user.uid;
//print("i cam here to :$h");
//if( user1.user.uid != null ){
//print("i m coming");
//Navigator.pushNamed(context, '/next');
//}
//
//},




//
//
//Scaffold(
//appBar: AppBar(
//title: Text("login"),
//),
//body: Center(
//child: Column(
//children: <Widget>[
//TextFormField(
//onSaved: (value) => u=value,
//
//decoration: InputDecoration(
//labelText: 'Enter your email:'
//),
//),
//TextFormField(
//obscureText: true,
//onSaved: (value) => p=value,
//decoration: InputDecoration(
//labelText: 'Enter your password:'
//),
//),
//FlatButton(
//child: Text("LOGIN"),
//onPressed:  () async {
//String user = u;
//String pass = p;
//AuthResult user1 = await FirebaseAuth.instance.signInWithEmailAndPassword(email: u, password: p);
//String h = user1.user.uid;
//print("i cam here to :$h");
//if( user1.user.uid != null ){
//print("i m coming");
//Navigator.pushNamed(context, '/next');
//}
//
//},
//),
//],
//),
//),

//);
















//
//
//Scaffold(
//appBar: AppBar(
//title: Text("login"),
//),
//body: Center(
//child: Column(
//children: <Widget>[
//TextFormField(
//onSaved: (value) => _u=value,
//validator: (value) => value.isEmpty ? 'Email can\'t be empty':null,
//
//decoration: InputDecoration(
//labelText: 'Enter your email:',
//
//),
//),
//TextFormField(
//obscureText: true,
//onSaved: (value) => _p=value,
//validator: (value) => value.isEmpty ? 'Password can\'t be empty':null,
//decoration: InputDecoration(
//labelText: 'Enter your password:'
//),
//),
//FlatButton(
//child: Text("LOGIN"),
//onPressed:  () async {
////                String user = u;
////                String pass = p;
////                AuthResult user2 = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "susu@tatti.com", password: "123456");
////                AuthResult user1 = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _u, password: _p);
//
//String h = user1.user.uid;
//print("i cam here to :$_p $_u");
//if( user1.user.uid != null ){
//print("i m coming");
//Navigator.pushNamed(context, '/next');
//}
//
//},
//),
//],
//),
//),
//
//);


