import 'package:flutter/material.dart';

class WidgetDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Column(
        children: <Widget> [
          Expanded(child: Container()),
          Text("Divider1"),


          Divider(
            height: 50,
            color: Colors.blue,
            thickness: 5,
            indent: 50,
            endIndent: 50,
          ),



          Text("Divider2"),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}