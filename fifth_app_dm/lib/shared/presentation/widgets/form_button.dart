import 'package:email_validator/email_validator.dart';
import 'package:first_app_dm/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';

class FormButtonUTFPR extends StatelessWidget {
  final TextEditingController emailController;
  final Function onPressed;

  const FormButtonUTFPR({
    Key? key,
    required this.emailController,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: EmailValidator.validate(emailController.text)
              ? () {
                  onPressed();
                }
              : null,
          child: const Text('Acessar'),
        ),
      ),
    );
  }
}
