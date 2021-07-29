import 'package:flutter/material.dart';

class UsandoMediaQuery extends StatefulWidget {
  @override
  _UsandoMediaQueryState createState() => _UsandoMediaQueryState();
}

class _UsandoMediaQueryState extends State<UsandoMediaQuery> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Media Query - Exemplo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Tamanho    : ${deviceInfo.size}',
                style: TextStyle(fontSize: 20.0)),
            Text('Orientação : ${deviceInfo.orientation}',
                style: TextStyle(fontSize: 20.0)),
            Text('Hora(24 h) : ${deviceInfo.alwaysUse24HourFormat}',
                style: TextStyle(fontSize: 20.0)),
            Text('Brilho     : ${deviceInfo.platformBrightness}',
                style: TextStyle(fontSize: 20.0)),
            Text('Padding    : ${deviceInfo.padding}',
                style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
