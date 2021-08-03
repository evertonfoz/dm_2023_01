import 'package:flutter/material.dart';


class ComEntry extends StatefulWidget {
  @required
  final String lblText;
  @required 
  final Function entryResult;
  @required 
  final String startEntry; 

  ComEntry({this.lblText, this.entryResult, this.startEntry});

  @override
  _ComEntryState createState() => _ComEntryState();
}

class _ComEntryState extends State<ComEntry> {
  String resultImput;

   @override
  void initState() {
    super.initState();
    setState(() {
      resultImput = widget.startEntry;
      //print(widget.startEntry);
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      //color: Colors.red,
      height: 50,
      child: TextFormField(
        autofocus: false,
        initialValue: resultImput,
        onChanged: (input) {
          setState(() {
          resultImput = input;
          });
          widget.entryResult(input);
        },
        //keyboardType: TextInputType.number,
        style: new TextStyle(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          labelText: widget.lblText,
          labelStyle: TextStyle(
          color: Colors.black
          ),
        ),
      ),
    );              
  }
}
