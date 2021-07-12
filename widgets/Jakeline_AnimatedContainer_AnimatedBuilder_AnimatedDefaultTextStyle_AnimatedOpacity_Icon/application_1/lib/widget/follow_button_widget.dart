import 'package:flutter/material.dart';

class FollowButtonWidget extends StatefulWidget {
  @override
  _FollowButtonWidgetState createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  bool isSmall = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            isSmall = !isSmall;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 3000),
          curve: Curves.bounceIn,
          width: isSmall ? 50 : 200,
          height: 50,
          child: isSmall ? buildShrinked() : buildStretched(),
        ),
      );

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 2.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              'FOLLOW',
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red,
        ),
        child: Icon(
          Icons.people,
          color: Colors.white,
        ),
      );
}
