import 'package:flutter/material.dart';

class UsandoTrasnForm extends StatefulWidget {
  UsandoTrasnForm() : super();

  final String title = "Widget TransForm";

  @override
  _UsandoTrasnFormState createState() => _UsandoTrasnFormState();
}

class _UsandoTrasnFormState extends State<UsandoTrasnForm> {
  double sliderVal = 0;

  @override
  initState() {
    super.initState();
    sliderVal = 0;
  }

  Container threeD() {
    return Container(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, sliderVal / 1000)
          ..rotateX(3.14 / 20.0),
        alignment: FractionalOffset.center,
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Container skew() {
    return Container(
      child: Transform(
        transform: Matrix4.skewX(sliderVal / 100),
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.blue,
        ),
      ),
    );
  }

  Container translate() {
    return Container(
      child: Transform.translate(
        offset: Offset(sliderVal, 0.0),
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.yellow,
        ),
      ),
    );
  }

  Container scale() {
    return Container(
      child: Transform.scale(
        scale: sliderVal == 0 ? 1 : sliderVal / 50,
        origin: Offset(0.0, 0.0),
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.green,
        ),
      ),
    );
  }

  Container rotate() {
    return Container(
      child: Transform.rotate(
        angle: sliderVal,
        origin: Offset(0.0, 0.0),
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
        ),
      ),
    );
  }

  Slider slider() {
    return Slider(
      value: sliderVal,
      min: 0,
      max: 100,
      onChanged: (val) {
        setState(() {
          sliderVal = val;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          slider(),
          rotate(),
          scale(),
          translate(),
          skew(),
          threeD(),
        ],
      ),
    );
  }
}
