import 'package:flutter/material.dart';

class WidgetIconButton extends StatefulWidget {

  @override
  _WidgetIconButtonState createState() => _WidgetIconButtonState();
}

class _WidgetIconButtonState extends State<WidgetIconButton> {


  Icon icones;
  bool status = true;

  @override
    void initState() {
      super.initState();

      icones = Icon(Icons.input_rounded, size: 50,);
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,


      child: IconButton(
        color: Colors.blue,
        //splashColor: Colors.yellow,
        //tooltip: "Icon Button",
        visualDensity: VisualDensity(horizontal: 0, vertical: 0),
        icon: icones,
        onPressed: ()=>{
          setState((){
            status == true ? icones = Icon(Icons.outlet_sharp, size: 50,) : icones = Icon(Icons.ac_unit_outlined, size: 50);
            status = !status; 
          }),
        },
        
      ),
    );
  }
}