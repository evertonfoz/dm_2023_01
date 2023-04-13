import 'package:flutter/material.dart';

import 'on_boarding_pages/about.dart';
import 'on_boarding_pages/welcome.dart';
import 'on_boarding_pages/widgets/dots.dart';
import 'on_boarding_pages/widgets/navigation_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController();
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const OBWelcome(),
    const OBAbout(),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Third Page'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageViewController,
            children: _pages,
            onPageChanged: (value) {
              setState(() {
                _selectedPage = value;
              });
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OBDots(totalPages: _pages.length, selectedPage: _selectedPage),
              OBNavigationButtons(
                pageController: _pageViewController,
                selectedPage: _selectedPage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
