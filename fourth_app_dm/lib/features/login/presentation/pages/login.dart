import 'package:first_app_dm/features/login/data/login_datasource.dart';
import 'package:first_app_dm/features/login/domain/user_entity.dart';
import 'package:first_app_dm/features/login/presentation/widgets/email_textfield.dart';
import 'package:first_app_dm/features/login/presentation/widgets/password_textfield.dart';
import 'package:first_app_dm/features/login/presentation/widgets/phone_textfield%20copy.dart';
import 'package:first_app_dm/shared/constants/sizedbox.dart';
import 'package:first_app_dm/shared/presentation/widgets/form_body.dart';
import 'package:first_app_dm/shared/presentation/widgets/form_button.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController(); //(text: 'aaa@bbb.ccc');
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final LoginDatasource loginDatasource = LoginDatasource();
    loginDatasource.getUser('aaa@bbb.ccc').then((userEntity) {
      if (userEntity != null) {
        _emailController.text = userEntity.email;
        _passwordController.text = userEntity.password;
      }
    });

    _emailController.addListener(() {
      if (_emailController.text.isNotEmpty) {
        var teste = _formKey.currentState!.validate();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: FormBodyUTFPR(
          title: 'Login',
          subTitle: 'Informe seu email e senha nos campos abaixo',
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginEmailTextField(
                  emailController: _emailController,
                ),
                kSizedBoxFieldsSeparator,
                const LoginPasswordTextField(),
                kSizedBoxFieldsSeparator,
                const PhonePasswordTextField(),
                kSizedBoxFieldsSeparator,
                FormButtonUTFPR(
                  emailController: _emailController,
                  onPressed: () async {
                    final LoginDatasource loginDatasource = LoginDatasource();
                    await loginDatasource.saveUser(
                      UserEntity(
                        email: _emailController.text,
                        password: _passwordController.text,
                        phone: '12345',
                      ),
                    );
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 2),
                        pageBuilder: (_, __, ___) => const HomePage(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'dash',
                    child: Image.network(
                      'https://lh3.googleusercontent.com/wEpdmU0qYb6-FPLeAwhPGpOG9x9YNz5bXKy1DiLled1xr5HtqwFYAUGIfnr7nNgoKN20WhBQTTs1XoC9aLDUDXx1VkjqEAWgLoaSXWbyek3pkltmYDRaNgPvmcswzZFUg95qDYcURfo=w400',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //
    );
  }
}
