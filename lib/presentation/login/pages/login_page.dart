import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/login/widgets/my_password_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backgroundColor, body: _buildLoginPage());
  }

  Widget _buildLoginPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: Image(
                height: 100,
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            ),
            Text(
              'Fazer Login',
              style: loginTitleStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  MyForm(controllerEmail, 'EMAIL', 1, 30,
                      TextInputType.emailAddress, false),
                  MyPasswordForm(controllerPassword, 'SENHA', 1, 30,
                      TextInputType.text, false, true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, signupRoute),
                      child: Text(
                        'CRIAR UMA CONTA',
                        style: loginNavigationStyle,
                        textAlign: TextAlign.center,
                      )),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, recoverPasswordRoute),
                      child: Text(
                        'ESQUECI MINHA SENHA!',
                        style: loginNavigationStyle,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onLogin,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Text("ENTRAR",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(black)),
            ),
          ],
        ),
      ),
    );
  }

  void onLogin() {
    Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false);
  }
}
