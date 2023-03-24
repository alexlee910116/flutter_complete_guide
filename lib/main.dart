// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/stateful_group.dart';
// import 'package:flutter_complete_guide/stateless_group.dart';
// import './question.dart';
// import './answer.dart';
// import 'package:flutter_complete_guide/flutter_layout.dart';

// void main() {
//   runApp(FlutterLayout());
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }
// class _MyAppState extends State<MyApp> {
//   var _questionIndex = 0;

//   void _answerQuestion() {
//     setState(() {
//       _questionIndex = _questionIndex + 1;
//     });
//     print(_questionIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var questions = [
//     //   {'questionText':'What\'s your favorite color?',
//     //   'answer': ['Black', 'Red', 'Green', 'White'],
//     //   },
//     //   {'questionText': 'What\'s your favorite animal?',
//     //   'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
//     //   },
//     //   {'questionText': 'Who\'s your favorite instructor?',
//     //   'answer': ['Alex', 'Bob', 'Cindy', 'David'],
//     //   }
//     // ];
//     return MaterialApp(
//       title: 'how to layout',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('How to layout'),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               color:Colors.grey))
//           ],
//         ),
//         // body: Column(
//         //   children: [
//             // Question(
//             //   // questions.elementAt(0),
//             //   questions[_questionIndex]['questionText'] as String,
//             //   ),
//             //   ...(questions[_questionIndex]['answer'] as List<String>).map((answer) {
//             //     return Answer(_answerQuestion, answer);
//             //   }).toList()
//           // ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/stateful_group.dart';
import 'package:flutter_complete_guide/stateless_group.dart';

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
