import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


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
          backgroundColor: ColorUtil.color('#a1FF5733'),
          foregroundColor: Colors.white,
        ),
        child: Text(anserText),
        onPressed: selectHandler, 
      ),
    );
  }
}
