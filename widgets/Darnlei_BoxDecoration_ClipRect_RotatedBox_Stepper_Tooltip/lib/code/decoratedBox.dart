import 'package:flutter/material.dart';
import 'package:widget_5/images.dart';

class UsandoDecorateBox extends StatefulWidget {
  const UsandoDecorateBox({Key key}) : super(key: key);

  @override
  _UsandoDecorateBoxState createState() => _UsandoDecorateBoxState();
}

class _UsandoDecorateBoxState extends State<UsandoDecorateBox> {
  String title = 'Widget DecorateBox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 5),
              image: DecorationImage(
                image: AssetImage(placeHolder),
              )),
        ),
      ),
    );
  }
}
