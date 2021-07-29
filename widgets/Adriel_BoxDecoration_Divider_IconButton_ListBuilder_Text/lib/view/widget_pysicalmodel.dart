import 'package:flutter/material.dart';

class WidgetPhysicalModel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PhysicalModel(
          color: Colors.white,
          elevation: 10,
          child: Container(
            alignment: Alignment.center,
            height: 100,
            color: Colors.blue,
            child: Text("Testando PhysicalModel",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ),
        ),
      ),
    );
  }
}