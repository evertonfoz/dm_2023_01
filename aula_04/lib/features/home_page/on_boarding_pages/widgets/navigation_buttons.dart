import 'package:flutter/material.dart';

class OBNavigationButtons extends StatelessWidget {
  final int selectedPage;
  final PageController pageController;

  const OBNavigationButtons(
      {super.key, required this.selectedPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (selectedPage > 0)
          TextButton(
            onPressed: () => pageController.animateToPage(
              (selectedPage - 1),
              duration: const Duration(seconds: 1),
              curve: Curves.decelerate,
            ),
            child: const Text(
              'Anterior',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        if (selectedPage == 0) const Spacer(),
        Visibility(
          visible: (selectedPage < 2),
          child: TextButton(
            onPressed: () => pageController.animateToPage(
              (selectedPage + 1),
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
            ),
            child: const Text(
              'Próximo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
