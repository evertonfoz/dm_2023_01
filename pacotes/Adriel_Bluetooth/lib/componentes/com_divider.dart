import 'package:flutter/material.dart';

class ComDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: MediaQuery.of(context).size.height*0.06,
      indent: 20,
      endIndent: 20,
      thickness: 5,
      color: Colors.blueGrey,
    );
  }
}