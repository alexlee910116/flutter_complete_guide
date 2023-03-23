import 'package:flutter/material.dart';


class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String anserText;

  Answer(this.selectHandler, this.anserText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        child: Text(anserText),
        onPressed: selectHandler, 
      ),
    );
  }
}
