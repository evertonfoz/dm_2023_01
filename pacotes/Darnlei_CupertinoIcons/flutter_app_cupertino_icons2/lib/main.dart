import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.smoke, size: 50, color: Colors.red,),
              Icon(CupertinoIcons.add_circled, size: 50,color: Colors.blue,),
              Icon(CupertinoIcons.square_arrow_up_on_square, size: 50, color: Colors.green,),
              Icon(CupertinoIcons.suit_heart, size: 50, color: Colors.brown,),
              Icon(CupertinoIcons.zzz, size: 50,color: Colors.yellow,)
            ],
          ),
        ),
      ),
    );
  }
}