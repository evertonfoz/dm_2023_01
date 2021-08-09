import 'package:flutter/material.dart';

class UsandoRefreshIndicator extends StatefulWidget {
  const UsandoRefreshIndicator({Key key}) : super(key: key);

  @override
  _UsandoRefreshIndicatorState createState() => _UsandoRefreshIndicatorState();
}

class _UsandoRefreshIndicatorState extends State<UsandoRefreshIndicator> {
  String title = 'Widget RefreshIndicator';

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        backgroundColor: Colors.yellow,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, i) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Text("item $i"),
              );
            }),
      ),
    );
  }
}
