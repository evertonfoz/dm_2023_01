import 'package:flutter/material.dart';

class WidgetListBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Padding(padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
        child:Container(
        width: 100,
        height: 100,



        child: ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: false,

        itemCount: 20,
        itemBuilder: (context, index){
          return Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Container(
              alignment: Alignment.center,
              color: Colors.black38,
              height: 50,
              width: 50,
              child: Text("List builder ${index+1}"),
            ),  
          );
        }
      ),
      ),
      ),
    );
  }
}