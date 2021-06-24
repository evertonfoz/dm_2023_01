import 'dart:math';
import 'package:flutter/material.dart';

class SliderAppBar extends StatelessWidget {

  final rnd = new Random();

  final List<Color> cores = [
    Colors.red,
    Colors.deepPurple,
    Colors.yellowAccent,
    Colors.green,
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    //Lista de Widgets do tipo Container de cores diferentes
    final List<Widget> itens = List.generate(10, (i) => Container(
      width: double.infinity,
      height: 150,
      color: cores[rnd.nextInt(this.cores.length)],
    ));
    //return  Scaffold(
    //  body: ListView.builder(
    //      itemBuilder: (BuildContext context, int index){
    //        return itens[index];
    //      },),
    //);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Center(child: Text('SliverAppBar')),
            expandedHeight: 100,
          ),
          SliverList(
            delegate: SliverChildListDelegate(itens),
          )
        ],
      ),
    );
  }
}