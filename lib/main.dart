import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'gesture.dart';
import 'launch_page.dart';
import 'res_page.dart';
import 'stateful_group.dart';
import 'stateless_group.dart';
import 'flutter_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('How to layout'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => StatelessGroup(),
        'full': (BuildContext context) => StatefullGroup(),
        'layout': (BuildContext context) => FlutterLayout(),
        'guesture': (BuildContext context) => GesturePage(),
        'respage': (BuildContext context) => Respage(),
        'launchpage': (BuildContext context) => LaunchPage(),

      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SwitchListTile(
            title: Text('${byName ? '' : 'No '}by router'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            }),
        _item('StatelessWidget', StatelessGroup(), 'less'),
        _item('StatefullWidget', StatefullGroup(), 'full'),
        _item('FlutterLayout', FlutterLayout(), 'layout'),
        _item('Gesture', GesturePage(), 'gesture'),
        _item('ResPage', Respage(), 'respage'), 
        _item('LaunchPage', LaunchPage(), 'launchpage'), 

      ]),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
