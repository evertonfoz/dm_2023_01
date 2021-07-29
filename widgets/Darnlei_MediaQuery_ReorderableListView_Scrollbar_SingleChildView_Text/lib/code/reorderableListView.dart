import 'package:flutter/material.dart';

class UsandoReorderableListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget ReorderablwListView',
      home: _UsandoReorderableListView(),
    );
  }
}

class _UsandoReorderableListView extends StatefulWidget {
  @override
  __UsandoReorderableListView createState() => __UsandoReorderableListView();
}

class __UsandoReorderableListView extends State<_UsandoReorderableListView> {
  List<String> _products =
      List.generate(50, (index) => "Item ${index.toString()}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget ReorderablwListView'),
      ),
      body: ReorderableListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final String productName = _products[index];
            return Card(
              key: ValueKey(productName),
              color: Colors.green,
              elevation: 1,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.all(25),
                title: Text(
                  productName,
                  style: TextStyle(fontSize: 25),
                ),
                trailing: Icon(Icons.drag_handle),
                onTap: () {/* Do something else */},
              ),
            );
          },
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = _products.removeAt(oldIndex);
              _products.insert(newIndex, element);
            });
          }),
    );
  }
}
