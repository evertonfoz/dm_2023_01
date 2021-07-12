import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData();

  return base.copyWith(
    primaryColor: Colors.deepPurple,
    hintColor: Colors.red,
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.green,
        ),
        hintStyle: TextStyle(
          color: Colors.blue,
        )),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double atualOp = 1;

  final Color azul = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: AnimatedOpacity(
        opacity: atualOp,
        duration: Duration(seconds: 1),
        child: Container(
          color: Colors.orange[50],
          padding: EdgeInsets.only(top: 16.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Nome user',
                    helperText: 'No max 10 letras',
                    labelText: 'User',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Coloque sua senha',
                    helperText: 'Max 12 caracteres',
                    labelText: 'Senha',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () {
          setState(() {
            FocusScope.of(context).requestFocus(FocusNode());
          });
        },
      ),
    );
  }
}
