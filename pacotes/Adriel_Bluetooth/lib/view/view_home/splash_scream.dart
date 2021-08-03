import 'package:flutter/material.dart';

class SplashScream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        color: Colors.blueGrey,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Container()),
            Icon(
              Icons.home_work_outlined,
              size: MediaQuery.of(context).size.height * 0.2,
              color: Colors.white70,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),

            Text(
              "Automação Residencial",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white70
              ),
            ),

            Expanded(child: Container()),

            CircularProgressIndicator(
              //backgroundColor: Colors.black,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white70),
            ),

            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                "by Adriel Rosso",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  color: Colors.white70
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}