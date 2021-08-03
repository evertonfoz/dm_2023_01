import 'package:flutter/material.dart';

class ButtonDefault extends StatefulWidget {

  @required
  final String textButton;
  @required
  final Function buttonClick;

  ButtonDefault({this.textButton, this.buttonClick});

  @override
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {widget.buttonClick()},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*0.5,
        height: MediaQuery.of(context).size.height*0.05,
        child: Text(widget.textButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height*0.020,
          ),
        ),
      ),
    );
  }
}