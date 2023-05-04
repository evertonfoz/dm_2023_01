import 'package:flutter/material.dart';

class TelefoneFuncionarioField extends StatelessWidget {
  final TextEditingController controller;

  const TelefoneFuncionarioField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.go,
      decoration: const InputDecoration(labelText: 'Telefone'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o telefone';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
