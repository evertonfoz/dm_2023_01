import 'package:flutter/material.dart';

class BarHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PhysicalModel( 
      color: Colors.white,
      elevation: 10,
        child:Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              Text("Automação Residencial",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height*0.03,
                  color: Colors.white70,
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.03, 0, MediaQuery.of(context).size.height*0.03)
              , child: Icon(
                Icons.home_work_outlined,
                size: MediaQuery.of(context).size.height*0.15,
                color: Colors.white70,  
              ),
              
              )
            ],
          )
        )
    );
  }
}