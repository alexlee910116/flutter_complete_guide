// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class StatelessGroup extends StatelessWidget {
  back(BuildContext context) {
      context.pop('/');
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StalessWidget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap:(){
            back(context);
          },
          child: Icon(Icons.arrow_back), ),
          title: Text('StatelessWidget')),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'I am Text',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.red,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('StalessWidget'),
                ),
              Divider(
                height: 20,
                indent: 0,
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'I am Card',
                    style: TextStyle(),
                  ),
                ),
              ),
              AlertDialog(
                title: Text('Just do it '),
                content: Text('Everything is possible'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
