import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Respage extends StatefulWidget {

  @override
  _RespageState createState() => _RespageState();
}

class _RespageState extends State<Respage> {
  String printString = '';
  double movex = 0, movey = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('How to resource'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child:
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width:100,
              height:100,
              image: AssetImage('images/a.jpeg'))
          ],
            ),
         ),
      ),
    );
  }
}
