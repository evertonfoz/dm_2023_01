
import 'package:flutter/material.dart';

class WidgetBoxDecoration extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black45,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: 
      
      
      Container(
        alignment: Alignment.center,
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(20),
         border: Border.all(color: Colors.black, width: 5),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(10, 10),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.yellow[800],
              Colors.yellow[700],
              Colors.yellow[600],
              Colors.yellow[400],
            ],
          ),
          /**/
        ),
        child: Text("Box Decoration"),

      ),
    );
  }
}

