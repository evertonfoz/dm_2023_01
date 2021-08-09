import 'package:flutter/material.dart';

class UsandoClipRect extends StatefulWidget {
  @override
  _UsandoClipRectState createState() => _UsandoClipRectState();
}

class _UsandoClipRectState extends State<UsandoClipRect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipperExamples(),
    );
  }
}

class ClipperExamples extends StatefulWidget {
  @override
  _ClipperExamplesState createState() => _ClipperExamplesState();
}

class _ClipperExamplesState extends State<ClipperExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF307777),
        title: Text("Widget ClipRect"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ClipRect
              Container(
                margin: EdgeInsets.only(
                  top: 40.0,
                ),
                child: Text(
                  "ClipRect",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipRect(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Image.network(
                        'https://i.pinimg.com/736x/10/ca/76/10ca760eddd0161fe41eb34d7424f598.jpg'),
                  ),
                ),
              ),

              /// ClipRRect
              Container(
                margin: EdgeInsets.only(
                  top: 40.0,
                ),
                child: Text(
                  "ClipRRect",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(300.0),
                child: Image.network(
                    "https://i.pinimg.com/736x/10/ca/76/10ca760eddd0161fe41eb34d7424f598.jpg"),
              ),

              /// ClipOval
              Container(
                margin: EdgeInsets.only(
                  top: 40.0,
                ),
                child: Text(
                  "ClipOval",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipOval(
                child: Container(
                  child: Image.network(
                      'https://i.pinimg.com/736x/10/ca/76/10ca760eddd0161fe41eb34d7424f598.jpg'),
                ),
              ),

              /// ClipPath
              Container(
                margin: EdgeInsets.only(
                  top: 40.0,
                ),
                child: Text(
                  "ClipPath",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipPath(
                clipper: TriangleClipper(),
                child: Image.network(
                    "https://i.pinimg.com/736x/10/ca/76/10ca760eddd0161fe41eb34d7424f598.jpg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
