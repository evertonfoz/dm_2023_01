import 'package:aula_04/features/home_page/on_boarding_pages/widgets/background.dart';
import 'package:flutter/material.dart';

class OBWelcome extends StatelessWidget {
  const OBWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const OBBackground(
      imageProvider: NetworkImage(
          'https://blog.rcky.com.br/wp-content/uploads/2021/03/delivery.jpg'),
      topText: 'Seja bem-vindo(a) ao Antônio\'s Food Delivery',
    );
  }
}
