import 'package:flutter/material.dart';

class FormButtonUTFPR extends StatelessWidget {
  const FormButtonUTFPR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: () {},
          // _emailIsValid != null && _emailIsValid!
          //     ? () {
          //         debugPrint('Email: ${_emailController.text}');
          //         debugPrint('Password: ${_passwordController.text}');
          //       }
          //     : null,
          child: const Text('Acessar'),
        ),
      ),
    );
  }
}
