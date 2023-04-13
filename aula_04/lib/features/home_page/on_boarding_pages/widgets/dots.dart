import 'package:flutter/material.dart';

class OBDots extends StatelessWidget {
  final int totalPages;
  final int selectedPage;

  const OBDots(
      {super.key, required this.totalPages, required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.only(
            right: 5,
          ),
          width: selectedPage == index ? 40 : 20,
          height: selectedPage == index ? 12 : 6,
          duration: const Duration(microseconds: 200),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
