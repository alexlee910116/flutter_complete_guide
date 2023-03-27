// import 'package:flutter/material.dart';
// import 'main.dart';
// import 'package:go_router/go_router.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
    
//     less(BuildContext context) {
//       context.push('/less');
//     }
//     full(BuildContext context) {
//       context.push('/full');
//     }
//     layout(BuildContext context) {
//       context.push('/layout');
//     }
//     gesture(BuildContext context) {
//       context.push('/gesture');
//     }
//     res(BuildContext context) {
//       context.push('/respage');
//     }
//     launch(BuildContext context) {
//       context.push('/launchpage');
//     }
//     photoapp(BuildContext context) {
//       context.push('/photoapp');
//     }

//     @override
//     Widget build(BuildContext context) {
//       final appbar =AppBar(
//       backgroundColor: Colors.blue,
//       title: const Text('Homepage'),
//     );
//       final button1 = ElevatedButton(
//       onPressed: () => less(context),
//       style: ElevatedButton.styleFrom( backgroundColor: Colors.blue),
//       child:const Text('stalessWidget')
//     );
//       final button2 = ElevatedButton(
//       onPressed: () => full(context),
//       style: ElevatedButton.styleFrom( backgroundColor: Colors.blue),
//       child:const Text('stalefullWidget')
//     );
//       final button3 = ElevatedButton(
//       onPressed: () => layout(context),
//       style: ElevatedButton.styleFrom( backgroundColor: Colors.blue),
//       child:const Text('layout')
//     );
//       final button4 = ElevatedButton(
//       onPressed: () => gesture(context),
//       style: ElevatedButton.styleFrom( backgroundColor: Colors.blue),
//       child:const Text('gesture')
//     );
//       final button5= ElevatedButton(
//         onPressed: () => res(context),
//         style: ElevatedButton.styleFrom( backgroundColor: Colors.blue),
//         child:const Text('respage')
//       );
      
//       final button6 = ElevatedButton(
//       onPressed: () => launch(context),
//       style: ElevatedButton.styleFrom( backgroundColor: Colors.blue),
//       child:const Text('launch')
//     );
//       final button7 = ElevatedButton(
//         onPressed: () => photoapp(context),
//         style: ElevatedButton.styleFrom( backgroundColor: Colors.blue),
//         child:const Text('photoapp')
//       );
//     return Scaffold(
//       appBar: appbar,
//       body: Center(child: Column(children: [
//         button1,
//         button2,
//         button3,
//         button4,
//         button5,
//         button6,
//         button7,
//       ],)),
//     );
//     }
//   }    

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void pushPage(BuildContext context, String route) {
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      'statelessWidget',
      'statefullWidget',
      'layout',
      'gesture',
      'respage',
      'launch',
      'photoapp'
    ].map((title) {
      return ElevatedButton(
        onPressed: () => pushPage(context, '/$title'.toLowerCase()),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: Text(title),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons,
        ),
      ),
    );
  }
}