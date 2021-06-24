import 'package:flutter/material.dart';

class ToolTipAccessibility extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Tooltip(
          message: 'Este é um botão Tooltip',
          child: OutlineButton(
            child: Text('Olá Mundo', style: TextStyle(fontSize: 20),),
            shape: StadiumBorder(),
            onPressed: () {  },
          ),
        ),
      ),
    );
  }
}
