// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FlutterLayout extends StatefulWidget {
  @override
  _FlutterLayout createState() => _FlutterLayout();
}

class _FlutterLayout extends State<FlutterLayout> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap:(){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back), ),
          title: Text('Layout')),
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
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                      'http://www.devio.org/img/avatar.png'),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.6,
                                    child: Image.network(
                                      'http://www.devio.org/img/avatar.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ))
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                hintText: 'Type in',
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                          Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                clipBehavior: Clip.antiAlias,
                                child: PageView(
                                  children: [
                                    _item('Page1', Colors.deepPurple),
                                    _item('Page2', Colors.yellowAccent),
                                    _item('Page3', Colors.greenAccent)
                                  ],
                                ),
                              )),
                          Column(
                            children: [
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.lightGreen),
                                  child: Text('full width'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network('http://www.devio.org/img/avatar.png'),
                                      width: 36,
                                      height: 36,)
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _chip('Flutter'),
                        _chip('Facebook'),
                        _chip('Instgram'),
                        _chip('Google'),
                        _chip('Twitter'),
                      ],
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Column(
              children: [
                Text('List'),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red.shade100),
                    child: Text('full-height'),
                  ),
                )
              ],
            ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
  
  _chip(String label) {
    return Chip(label: Text(label),
    avatar: CircleAvatar(
      backgroundColor: Colors.blue.shade900,
      child:Text(
        label.substring(0,1),
        style: TextStyle(fontSize: 10),)
      ),
    );
  }
}

_item(String title, Color color) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color),
    child: Text(
      title,
      style: TextStyle(fontSize: 22, color: Colors.white),
      
    ),
  );
}
