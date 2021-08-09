import 'package:flutter/material.dart';

class UsandoNestedScrollView extends StatelessWidget {
  const UsandoNestedScrollView({Key key}) : super(key: key);

  static const String _title = 'Widget NestedScrollView';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            title: const Text('Widget NestedScrollView'),
            centerTitle: true,
            floating: true,
            snap: true,
            expandedHeight: 100.0,
            forceElevated: innerBoxIsScrolled,
          ),
        )
      ];
    }, body: Builder(builder: (BuildContext context) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  ListTile(title: Text('Item $index')),
              childCount: 50,
            ),
          ),
        ],
      );
    })));
  }
}
