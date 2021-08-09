import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UsandoNotificationListener extends StatefulWidget {
  final String title = "Widget NotificationListener";

  @override
  _UsandoNotificationListenerState createState() =>
      _UsandoNotificationListenerState();
}

class _UsandoNotificationListenerState
    extends State<UsandoNotificationListener> {
  bool showFab = false;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          setState(() {
            if (notification.direction == ScrollDirection.forward) {
              showFab = false;
            } else if (notification.direction == ScrollDirection.reverse) {
              showFab = true;
            }
          });
          return true;
        },
        child: ListView.builder(
          itemCount: 100,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              child: Icon(Icons.arrow_circle_down_rounded),
              onPressed: () {
                _scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent);
              },
            )
          : null,
    );
  }
}
