import 'package:flutter/material.dart';

class UsandoTooltip extends StatelessWidget {
  const UsandoTooltip({Key key}) : super(key: key);

  static const String _title = 'Widget ToolTip';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Aqui está o Tooltip!!!!!',
      child: Padding(
        padding: const EdgeInsets.all(70.0),
        child: const Text(
          'Toque neste texto e mantenha pressionado para mostrar uma dica de ferramenta.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient:
            const LinearGradient(colors: <Color>[Colors.amber, Colors.red]),
      ),
      height: 50,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
        fontSize: 24,
      ),
      showDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
    );
  }
}
