import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/photo_app.dart';
import 'gesture.dart';
import 'launch_page.dart';
import 'res_page.dart';
import 'stateful_group.dart';
import 'stateless_group.dart';
import 'flutter_layout.dart';
import 'homepage.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp(
    title:'Flutter',
    home:MyApp(),
  ));}

class MyApp extends StatelessWidget {
  
  final router = GoRouter(
      initialLocation: '/',
      
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
        ),
      GoRoute(
        path: '/less',
        builder:(context,state) => StatelessGroup()
      ),
      GoRoute(
        path: '/full',
        builder:(context,state) => StatefullGroup()
      ),
      GoRoute(
        path: '/layout',
        builder:(context,state) => FlutterLayout()
      ),
      GoRoute(
        path: '/gesture',
        builder:(context,state) => GesturePage()
      ),
      GoRoute(
        path: '/respage',
        builder:(context,state) => Respage()
      ),
      GoRoute(
        path: '/launchpage',
        builder:(context,state) => LaunchPage()
      ),
      GoRoute(
        path: '/photoapp',
        builder:(context,state) => PhotoApp()
      ),
    ]
  );

  
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );

  
      
      // routes: <String, WidgetBuilder>{
      //   'less': (BuildContext context) => StatelessGroup(),
      //   'full': (BuildContext context) => StatefullGroup(),
      //   'layout': (BuildContext context) => FlutterLayout(),
      //   'guesture': (BuildContext context) => const GesturePage(),
      //   'respage': (BuildContext context) => Respage(),
      //   'launchpage': (BuildContext context) => LaunchPage(),
  }
}

// class RouteNavigator extends StatefulWidget {
//   @override
//   _RouteNavigatorState createState() => _RouteNavigatorState();
// }

// class _RouteNavigatorState extends State<RouteNavigator> {
//   bool byName = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SwitchListTile(
//           title: Text('${byName ? '' : 'No '}by router'),
//           value: byName,
//           onChanged: (value) {
//             setState(() {
//               byName = value;
//             });
//           }),
          
      // _item('StatelessWidget', StatelessGroup(), 'less'),
      // _item('StatefullWidget', StatefullGroup(), 'full'),
      // _item('FlutterLayout', FlutterLayout(), 'layout'),
      // _item('Gesture', GesturePage(), 'gesture'),
      // _item('ResPage', Respage(), 'respage'), 
      // _item('LaunchPage', LaunchPage(), 'launchpage'), 

  
  // _item(String title, page, String routeName) {
  //   return ElevatedButton(
  //     onPressed: () {
  //       if (byName) {
  //         Navigator.pushNamed(context, routeName);
  //       } else {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => page));
  //       }
  //     },
  //     child: Text(title),
  //   );
  // }
