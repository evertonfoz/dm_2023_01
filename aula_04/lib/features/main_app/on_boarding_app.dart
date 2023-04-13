import 'package:flutter/material.dart';

import '../home_page/home.dart';

class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On Boarding App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
