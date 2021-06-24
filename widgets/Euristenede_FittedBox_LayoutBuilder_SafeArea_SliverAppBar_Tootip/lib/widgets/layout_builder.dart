import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ColunasConteudo()
      ),

    );
  }
}

class ColunasConteudo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final children = [
      Expanded(child: Retangulo()),
      Expanded(child: Retangulo())
    ];

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          print(constraints.maxWidth);
          return ( constraints.maxWidth <= 384 )
              ? Column(children: children,)
              : Row(children: children,);
        }
    );
  }
}

class Retangulo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}