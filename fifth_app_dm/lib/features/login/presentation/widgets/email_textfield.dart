import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginEmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  LoginEmailTextField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  // late bool _emailIsValid;

  @override
  Widget build(BuildContext context) {
    // _emailIsValid = EmailValidator.validate(emailController.text);

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        prefixIcon: const Icon(Icons.email),
        suffixIcon: const Icon(Icons.text_fields),
        errorBorder: (!EmailValidator.validate(emailController.text))
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              )
            : InputBorder.none,
      ),
      validator: (value) {
        if (!EmailValidator.validate(emailController.text)) {
          return 'Informe um email válido';
        }
        return null;
      },
    );
  }
}
