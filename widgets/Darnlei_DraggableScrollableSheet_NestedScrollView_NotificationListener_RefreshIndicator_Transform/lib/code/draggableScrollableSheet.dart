import 'package:flutter/material.dart';

class UsandoDragabbleScrollableSheet extends StatefulWidget {
  @override
  _UsandoDragabbleScrollableSheetState createState() =>
      _UsandoDragabbleScrollableSheetState();
}

class _UsandoDragabbleScrollableSheetState
    extends State<UsandoDragabbleScrollableSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget DraggableScrollableSheet'),
          centerTitle: true,
        ),
        body: Container(
          child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (BuildContext context, myscrollController) {
              return Container(
                color: Colors.tealAccent[200],
                child: ListView.builder(
                  controller: myscrollController,
                  itemCount: 45,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(
                      'Item $index',
                      style: TextStyle(color: Colors.blue),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
