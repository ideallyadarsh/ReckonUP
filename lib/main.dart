import 'package:flutter/material.dart';
import 'home.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/main',
  routes: {
    '/main':(context)=>Main(),
    '/next':(context)=>Home(),
  },
));

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: RaisedButton(child: Text("   Click here \n to go to next page"),onPressed: (){
          Navigator.pushNamed(context, '/next');
        },
        color: Colors.blueAccent,
        ),
      ),
      
    );
  }
}
