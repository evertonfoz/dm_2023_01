import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginEmailTextField extends StatefulWidget {
  const LoginEmailTextField({Key? key}) : super(key: key);

  @override
  State<LoginEmailTextField> createState() => _LoginEmailTextFieldState();
}

class _LoginEmailTextFieldState extends State<LoginEmailTextField> {
  final TextEditingController _emailController = TextEditingController();

  bool? _emailIsValid;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        prefixIcon: const Icon(Icons.email),
        suffixIcon: const Icon(Icons.text_fields),
        errorBorder: (_emailIsValid != null && !_emailIsValid!)
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              )
            : InputBorder.none,
        errorText: (_emailIsValid != null && !_emailIsValid!)
            ? "Informe um email válido"
            : null,
        // errorStyle: anyTextStyle(),
      ),
      onChanged: (value) {
        setState(() {
          _emailIsValid = EmailValidator.validate(value);
          // _emailIsValid = RegExp(
          //         r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
          //     .hasMatch(value);
        });

        debugPrint('Email: $value');
      },
    );
  }
}
