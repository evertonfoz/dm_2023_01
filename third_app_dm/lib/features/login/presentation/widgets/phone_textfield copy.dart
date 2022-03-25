import 'package:flutter/material.dart';

class PhonePasswordTextField extends StatefulWidget {
  const PhonePasswordTextField({Key? key}) : super(key: key);

  @override
  State<PhonePasswordTextField> createState() => _PhonePasswordTextFieldState();
}

class _PhonePasswordTextFieldState extends State<PhonePasswordTextField> {
  final TextEditingController _phoneController = TextEditingController();

  bool? _phoneIsValid;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.numbers),
        prefixIcon: Icon(Icons.phone),
        prefix: Text('+55'),
      ),
    );
  }
}
