import 'package:flutter/material.dart';

class SettingsBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 600,
                  color: Colors.blue,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image(image: NetworkImage('https://previews.123rf.com/images/serafimamanekina/serafimamanekina1904/serafimamanekina190400025/123529893-bird-golden-pheasant-sketch-vector-graphic-color-illustration-on-white-background.jpg'),),
                  ),
                ),
                Divider(),

              ],
            ),
          ),
        ),
    );
  }
}