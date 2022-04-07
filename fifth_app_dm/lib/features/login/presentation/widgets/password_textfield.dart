import 'package:flutter/material.dart';

class LoginPasswordTextField extends StatefulWidget {
  const LoginPasswordTextField({Key? key}) : super(key: key);

  @override
  State<LoginPasswordTextField> createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
  final TextEditingController _passwordController = TextEditingController();

  bool? _passwordIsValid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Senha',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
        TextField(
          controller: _passwordController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.remove_red_eye),
                  Icon(Icons.text_fields),
                ],
              ),
            ),
            prefixIcon: const Icon(Icons.password),
          ),
        ),
      ],
    );
  }
}
