import 'package:flashcard/infrastructure/models/create_user_payload.dart';
import 'package:flashcard/infrastructure/repositories/auth_repository.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/login/widgets/my_password_form.dart';
import 'package:flashcard/ui_style_guides/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class RegistrationPage extends StatefulWidget {
  final AuthRepository authRepository = AuthRepository();

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final AuthRepository _repository;
  ValueNotifier<bool> loading = ValueNotifier(false);
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPasswordConfirmation =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _repository = widget.authRepository;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: backgroundColor,
        body: ValueListenableBuilder<bool>(
          valueListenable: loading,
          builder: (context, value, widget) => value
              ? Loader()
              : SingleChildScrollView(child: _buildRegistrationPage()),
        ));
  }

  Widget _buildRegistrationPage() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Criar Conta',
            style: loginTitleStyle,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                MyForm(controllerUsername, 'NOME COMPLETO', 1, 30,
                    TextInputType.text, false),
                MyForm(controllerEmail, 'EMAIL', 1, 30,
                    TextInputType.emailAddress, false),
                MyPasswordForm(controllerPassword, 'SENHA', 1, 30,
                    TextInputType.text, false, true),
                MyPasswordForm(
                    controllerPasswordConfirmation,
                    'CONFIRMAÇÃO DE SENHA',
                    1,
                    30,
                    TextInputType.text,
                    false,
                    true),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, loginRoute),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Text("CANCELAR", style: subTitleStyleBold),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(hoverMainColor)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => submitRegistration(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Text("CADASTRAR", style: subTitleStyleBoldWhite),
                  ),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(black)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void submitRegistration() {
    var payload = CreateUserPayload(
        email: controllerEmail.text,
        name: controllerUsername.text,
        password: controllerPassword.text);
    loading.value = true;
    _repository.createUser(payload).then((value) {
      Navigator.pop(context);
      Navigator.pushNamed(context, loginRoute);
    }).onError((error, stackTrace) {
      loading.value = false;
    });
  }
}
