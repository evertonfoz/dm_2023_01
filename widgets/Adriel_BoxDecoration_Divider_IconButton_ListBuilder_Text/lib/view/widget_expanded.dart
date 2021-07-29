import 'package:flutter/material.dart';

class WidgetExpanded extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
          /**/Expanded(
            child: Container(
              color: Colors.pink,
            )
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}