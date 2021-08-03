import 'package:flutter/material.dart';

class ComButtonAdd extends StatelessWidget {

  @required
  final Function buttonCliked;

  ComButtonAdd({this.buttonCliked});

  @override
  Widget build(BuildContext context) {
    return Container(
     height:  MediaQuery.of(context).size.height*0.08,
      width:  MediaQuery.of(context).size.height*0.08,
      decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(1, 1)
          )
        ],
      ),
      child: TextButton(
        onPressed: () => buttonCliked(), 
        child: 
        Icon(
          Icons.add,
          color: Colors.white,
          size: MediaQuery.of(context).size.height*0.05,
        ),
      ),
    );
  }
}