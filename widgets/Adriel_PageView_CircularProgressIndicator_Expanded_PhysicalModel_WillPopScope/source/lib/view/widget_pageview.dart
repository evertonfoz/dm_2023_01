import 'package:flutter/material.dart';
import 'package:trebalhowidget/view/widget_circularprogressindicator.dart';
import 'package:trebalhowidget/view/widget_expanded.dart';
import 'package:trebalhowidget/view/widget_pysicalmodel.dart';
import 'package:trebalhowidget/view/widget_willpopscope.dart';

class WidgetPageView extends StatefulWidget {

  @override
  _WidgetPageViewState createState() => _WidgetPageViewState();
}

class _WidgetPageViewState extends State<WidgetPageView> {

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              reverse: false,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              //physics: BouncingScrollPhysics(),
              onPageChanged: (value) =>{
                setState(() {
                index=value+1;
                })
              },
              children: <Widget>[
                WidgetCircularProgressIndicator(),
                WidgetExpanded(),
                WidgetPhysicalModel(),
                WidgetWillPopScope(),
              ]
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.black,
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Test PageView página $index",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
          ),
        ],
      )
    );
  }
}
