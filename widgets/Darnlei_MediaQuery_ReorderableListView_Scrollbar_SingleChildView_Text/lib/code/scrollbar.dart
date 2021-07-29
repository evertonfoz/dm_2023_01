import 'package:flutter/material.dart';

class UsandoScrollbar extends StatelessWidget {
  const UsandoScrollbar({Key key}) : super(key: key);

  static const String _title = 'Widget scrollbar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const _UsandoScrollbar(),
      ),
    );
  }
}

class _UsandoScrollbar extends StatelessWidget {
  const _UsandoScrollbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
        itemCount: 50,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              'Item posição $index',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
