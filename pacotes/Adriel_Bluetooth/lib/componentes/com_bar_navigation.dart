import 'package:flutter/material.dart';

class BarNavigation extends StatefulWidget {

  @required
  final String texttitle;

  @required
  final Function buttonBackClick;
  
  BarNavigation({this.texttitle, this.buttonBackClick});

  @override
  _BarNavigationState createState() => _BarNavigationState();
}

class _BarNavigationState extends State<BarNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.12,
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () => widget.buttonBackClick(), 
                child: Container(
                  child: Text(
                    "<",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.05,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, 0, 0),
                child: Text(
                  widget.texttitle,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.025,
                    color: Colors.white
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}