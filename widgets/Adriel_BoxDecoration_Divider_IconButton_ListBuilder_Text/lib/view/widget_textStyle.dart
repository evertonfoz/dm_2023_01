import 'package:flutter/material.dart';

class WidgetTextStyle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      
      child: Text(
        "Text Style",
        style: TextStyle(
          fontSize: 20,
          color: Colors.blue,
          wordSpacing: 2,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          letterSpacing: 2,
          
        ),
      ),
    );
  }
}