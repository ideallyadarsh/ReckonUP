import 'package:flutter/material.dart';
import 'package:reckonup/Pages/Setup/signin.dart';
import 'package:reckonup/Pages/Setup/signup.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.pinkAccent,
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
            child: Text("ALREADY HAVE AN ACCOUNT?",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
            ),),
            onPressed:navigateToSignIn,
          )
        ],
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
