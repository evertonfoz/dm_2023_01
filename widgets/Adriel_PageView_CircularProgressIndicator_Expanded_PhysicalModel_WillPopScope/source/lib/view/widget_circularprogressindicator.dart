import 'package:flutter/material.dart';

class WidgetCircularProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          //backgroundColor: Colors.black45,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black87),
        ),
      )
    );
  }
}