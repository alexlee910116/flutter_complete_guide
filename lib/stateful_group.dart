// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class StatefullGroup extends StatefulWidget {
  @override
  _StatefullGroup createState() => _StatefullGroup();
}

class _StatefullGroup extends State<StatefullGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefullWidget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap:(){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back), ),
          title: Text('StatefullWidget')),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  label: ('Home')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  label: ('List'))
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('Click'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child:
                ListView(
                   children: [Container(
                  decoration: BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.network('http://www.devio.org/img/avatar.png',
                      width: 100,
                      height: 100,),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          hintText: 'Type in',
                          hintStyle: TextStyle(fontSize: 15) 
                        ),
                      ),
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(top:100),
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        child: PageView(
                          children: [
                            _item('Page1', Colors.deepPurple),
                            _item('Page2', Colors.yellowAccent),
                            _item('Page3', Colors.greenAccent)
                          ],
                        ),
                      ),
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
                        label: Text('StatefullWidget'),
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
                ),],
              ),
                onRefresh: _handleRefresh)
            : Text('List'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
}

_item(String title,Color color) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color),
    child: Text(title,style: TextStyle(fontSize: 22,color: Colors.white),),
  );
}
