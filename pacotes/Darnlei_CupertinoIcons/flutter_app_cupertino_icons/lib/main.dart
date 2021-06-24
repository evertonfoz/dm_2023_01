import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainEntry());
class MainEntry extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white70,
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      home:Entry(),
    );
  }
}


class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Icons"),
      ),
      body: Container(
        //decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Icon(IconData(0XF111,fontFamily: "CupertinoIcons"),size: 50.0,color: Colors.green,),
        ),
      ),
    ) ;
  }
}