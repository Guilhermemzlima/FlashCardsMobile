import 'package:flashcard/presentation/login/widgets/my_password_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class RecoverPasswordPage extends StatelessWidget {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPasswordConfirmation =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: backgroundColor,
        body: Container(
          child: _buildRecoverPassword(),
        ));
  }

  Widget _buildRecoverPassword() {
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
                MyForm(
                    controllerEmail, 'EMAIL', 1, 30, TextInputType.text, false),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: () => print('VOLTA PAR O LOGIN'),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: Text("CANCELAR", style: subTitleStyleBold),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(hoverMainColor)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => print('CRIA USUARIO'),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
}
