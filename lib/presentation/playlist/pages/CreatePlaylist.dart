import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class CreatePlaylist extends StatelessWidget {
  const CreatePlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Criar Playlist"),
        body: Container(
          child: CreateForms(),
        ));
  }
}
