
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reckonup/Pages/Setup/login.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email,_password;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
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
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 20.0, 5, 0),
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_circle,color: Colors.white,size: 70.0,),
              SizedBox(height: 20),
                     Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("E-Mail",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22.0,
                            ),
                          ),
                          TextFormField(
                            validator: (input) {
                              if(input.isEmpty)
                              {
                                return 'Please enter your email';
                              }
                            },
                            onSaved: (input)=>_email=input,
                            decoration: InputDecoration(hintText: 'Your E-mail',
                              errorStyle: TextStyle(color: Colors.white,),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ],

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : <Widget>[
                          Text("Password",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22.0,
                            ),
                          ),
                          TextFormField(
                            validator: (input) {
                              if(input.length<8)
                              {
                                return "Password must be 8 character long";
                              }
                            },
                            onSaved: (input)=>_password=input,
                            decoration: InputDecoration(hintText: 'Create a Password',
                              errorStyle: TextStyle(color: Colors.white,),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),

                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            obscureText: true,
                          ),

                        ]
                      ),
                    ),
                SizedBox(height: 20,),
                RaisedButton(
                 color: Colors.white,
                  elevation: 1.0,

                  child: Text("Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.5,
                  ),),
                  onPressed:register,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> register() async
  {
    final formState= _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        user.sendEmailVerification();
       //display for the user that we send an email

        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginPage()));
        //TODO:navigate to home page
      }catch(e){
        print(e.message);
      }
    }
  }
}
