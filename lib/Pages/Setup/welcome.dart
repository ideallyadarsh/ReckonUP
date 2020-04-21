import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reckonup/Pages/Setup/login.dart';
import 'package:reckonup/Pages/Setup/register.dart';
import 'package:reckonup/Pages/home.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> getUser() async{
    return await _auth.currentUser();
  }
  @override
  void initState() {
    super.initState();
    getUser().then((user) {
      if (user != null) {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Home(user : user)));
        // send the user to the home page
        // homePage();
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage(),fullscreenDialog: true));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.4,1],
          colors: [
                Colors.pinkAccent,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
               Text("Hello!\n\n"
                  "Welcome to ReckonUp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                       ),
                  textAlign: TextAlign.center,
               ),
            Text("\nNow Manage your expenses with ease😊",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),


            SizedBox(height: 80.0,),
            Center(
              child: RaisedButton(
                child: Text("Register",
                style:TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 1.5,
                ),
                ),
                onPressed:navigateToSignUp,
              ),
            ),
            SizedBox(height: 10.0,),
            FlatButton(
             // color: Colors.lightBlue,
              child: Text("ALREADY HAVE AN ACCOUNT? SIGNIN",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
              ),),
              onPressed:navigateToSignIn,
            )
          ],
        ),
      ),
    );
  }
  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage(),fullscreenDialog: true));//fullscrenndialogue puts a cross on top of screen insted of back arrow
  }
  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUp(),fullscreenDialog: true));//fullscrenndialogue puts a cross on top of screen insted of back arrow

  }
}
