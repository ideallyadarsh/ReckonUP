import 'package:reckonup/Pages/Setup/welcome.dart';
import 'package:flutter/material.dart';

import 'Pages/Setup/welcome.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Being healthy',
      color: Colors.blueAccent,
      home: WelcomePage(),
    );
  }
}



