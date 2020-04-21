import 'package:flutter/material.dart';

class addpage extends StatefulWidget {
  @override
  _addpageState createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle) ,
            onPressed: (){},
          ),
        ],
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
                            tooltip: 'Add Items',
                     backgroundColor: Colors.pinkAccent,
      onPressed: (){

      },
      ),
    );
  }
}
