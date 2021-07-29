import 'package:flutter/material.dart';

class UsuandoSingleChildScrowllView extends StatelessWidget {
  const UsuandoSingleChildScrowllView({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: _UsuandoSingleChildScrowllView(),
    );
  }
}

class _UsuandoSingleChildScrowllView extends StatelessWidget {
  const _UsuandoSingleChildScrowllView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: const Color(0xffeeee00), // Yellow
                      height: 100.0,
                      alignment: Alignment.center,
                      child: const Text('Conteúdo de Altura Fixa'),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xffee0000), // Red
                        height: 500.0,
                        alignment: Alignment.center,
                        child: const Text('Conteúdo Flexível'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
