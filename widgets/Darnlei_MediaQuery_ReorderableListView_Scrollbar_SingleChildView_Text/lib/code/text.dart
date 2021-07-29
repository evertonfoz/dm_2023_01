import 'package:flutter/material.dart';

class UsandoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Widget Text",
        theme: ThemeData(primaryColor: Colors.blue),
        home: WidgetText());
  }
}

class WidgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Widget Text"),
        ),
        body: Container(
            color: Colors.white,
            child: Center(
              child: Text("Widget Text",
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      decorationStyle: TextDecorationStyle.wavy)),
            )));
  }
}
