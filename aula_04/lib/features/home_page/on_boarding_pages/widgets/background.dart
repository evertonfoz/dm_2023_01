import 'package:flutter/material.dart';

class OBBackground extends StatelessWidget {
  final ImageProvider imageProvider;
  final String topText;

  const OBBackground({
    super.key,
    required this.imageProvider,
    required this.topText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
          image: imageProvider,
          // const NetworkImage(
          //     'https://blog.rcky.com.br/wp-content/uploads/2021/03/delivery.jpg'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 60.0,
          left: 8,
          right: 8,
        ),
        child: Text(
          topText,
          // 'Seja bem-vindo(a) ao Antônio\'s Food Delivery',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
