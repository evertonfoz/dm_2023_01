import 'package:flutter/material.dart';
import 'package:widget_5/images.dart';

class UsandoRotatedBox extends StatefulWidget {
  const UsandoRotatedBox({Key key}) : super(key: key);

  @override
  _UsandoRotatedBoxState createState() => _UsandoRotatedBoxState();
}

class _UsandoRotatedBoxState extends State<UsandoRotatedBox> {
  String title = 'Widget RotateBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: ClipPath(
            child: Image(
              image: AssetImage(placeHolder),
              height: 200.0,
              width: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
