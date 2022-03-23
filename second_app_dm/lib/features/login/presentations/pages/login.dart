import 'package:first_app_dm/features/login/presentations/widgets/email_textfield.dart';
import 'package:first_app_dm/features/login/presentations/widgets/password_textfield.dart';
import 'package:first_app_dm/features/login/presentations/widgets/phone_textfield%20copy.dart';
import 'package:first_app_dm/shared/constants/sizedbox.dart';
import 'package:first_app_dm/shared/presentation/widgets/form_body.dart';
import 'package:first_app_dm/shared/presentation/widgets/form_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: FormBodyUTFPR(
        title: 'Login',
        subTitle: 'Informe seu email e senha nos campos abaixo',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            LoginEmailTextField(),
            kSizedBoxFieldsSeparator,
            LoginPasswordTextField(),
            kSizedBoxFieldsSeparator,
            PhonePasswordTextField(),
            kSizedBoxFieldsSeparator,
            FormButtonUTFPR(),
          ],
        ),
      ),

      //
    );
  }
}
