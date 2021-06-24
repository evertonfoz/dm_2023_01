import 'package:flutter/material.dart';

class SettingsArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //home: Text('Olá Mundo'),
      home: Scaffold(
        body: SafeArea(
          child: Text(
            "Olá Mundo!!!",
            style: TextStyle(fontSize: 30),
          ),
        ),
        /*body: SafeArea(
          child: ListView(
            children: List.generate(
                100, (i) => Text('$i - Olá mundo', style:  TextStyle(fontSize: 30),)
            ),
          ),
        ),*/
      ),
    );
  }
}