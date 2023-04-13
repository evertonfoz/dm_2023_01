import 'package:flutter/material.dart';

import 'widgets/background.dart';

class OBAbout extends StatelessWidget {
  const OBAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const OBBackground(
      imageProvider: AssetImage('assets/images/about.png'),
      topText: 'Seja bem-vindo(a) ao Antônio\'s Food Delivery',
    );
  }
}
