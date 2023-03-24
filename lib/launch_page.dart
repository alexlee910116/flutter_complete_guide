import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri url = Uri.parse('https://www.google.com');

class LaunchPage extends StatefulWidget {

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
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
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child:
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (_launchUrl),
            child: Text('open the browser'),)
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