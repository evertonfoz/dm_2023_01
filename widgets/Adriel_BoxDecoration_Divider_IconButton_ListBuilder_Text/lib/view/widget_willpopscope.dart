import 'package:flutter/material.dart';

class WidgetWillPopScope extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text(
          "Testando WillPopScope",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ), 
    );
  }
}