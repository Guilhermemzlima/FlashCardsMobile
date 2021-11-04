import 'package:flashcard/presentation/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/navigation/pages.dart';

void main() {
  runApp(FlashCards());
}

class FlashCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashCards',
      home: LibraryPage(),
      // routes: routes,
      onGenerateRoute: generateRoutes,
    );
  }
}
