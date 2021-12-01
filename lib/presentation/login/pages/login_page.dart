import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: backgroundColor,
        body: Container(
          child: CreateLogin(),
        ));
  }
}

class CreateLogin extends StatelessWidget {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  MyForm(controllerEmail, 'EMAIL', 1, 30, TextInputType.text,
                      false),
                  MyPasswordForm(controllerPassword, 'SENHA', 1, 30,
                      TextInputType.text, false, true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () => print('IR PARA O CADASTRO'),
                      child: Text(
                        'CRIAR UMA CONTA',
                        style: loginNavigationStyle,
                        textAlign: TextAlign.center,
                      )),
                  TextButton(
                      onPressed: () => print('IR PARA ESQUECI MINHA SENHA!'),
                      child: Text(
                        'ESQUECI MINHA SENHA!',
                        style: loginNavigationStyle,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => print('ENTRAR'),
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

  void _createPlaylist(BuildContext context) {
    // final String playlistName = _controllerPlaylistName.text;
    // final String playlistDescription = _controllerPlaylistDescription.text;
    print("Não entendi oq tava aqui");
    // if ((playlistName != '') && playlistDescription != '') {
    //   final newListItem = ListItemProperties(
    //       title: playlistName,
    //       subtitle: playlistDescription,
    //       isVerified: false);
    //   print('$newListItem');
    //   Navigator.pop(context, newListItem);
  }
}
