import 'package:flutter/material.dart';

class FuncionarioBotaoGravar extends StatelessWidget {
  final Function() onPressed;
  final VoidCallback onPressedNovo;

  const FuncionarioBotaoGravar({
    super.key,
    required this.onPressed,
    required this.onPressedNovo,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
        final snackBar = SnackBar(
          duration: const Duration(seconds: 10),
          // showCloseIcon: true,
          backgroundColor: Colors.green,
          content: Row(
            children: [
              const Text('Tudo certo'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  onPressedNovo();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: const Text('Novo'),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context).pop();
                },
                child: const Text('Finalizar'),
              ),
            ],
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('Gravar'),
    );
  }
}
