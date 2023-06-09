import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

final Uri url = Uri.parse('https://www.google.com');

class LaunchPage extends StatefulWidget {

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  back(BuildContext context) {
      context.pop('/');
    }
  String printString = '';
  double movex = 0, movey = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('How to launch other app'),
          leading: GestureDetector(
            onTap: () {
              back(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child:
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (_launchUrl),
            child: Text('open the browser'),
            ),
            ElevatedButton(onPressed:()=> _openMap(),
            child: Text('open the map'),
            )
          ],
            ),
         ),    
      ),
    );
  }
}
 Future<void> _launchUrl() async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

_openMap() async {
  const _url = 'geo:52.32,4.917';
  if (await launch(_url)) {
    await launch(_url);
  } else {
    const _url = 'http://maps.apple.com/?ll=52.32,4.917';
    if (await canLaunchUrl(url)) {
    await launch(_url);
  } else {
    throw Exception('Could not launch $url');
  }
} }