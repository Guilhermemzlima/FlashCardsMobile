import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/navigation/pages.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

void main() {
  runApp(FlashCards());
}

class FlashCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'FlashCards', home: LibraryPage());
  }
}
