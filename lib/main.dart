import 'package:flashcard/presentation/home/pages/home_page.dart';
import 'package:flashcard/presentation/login/pages/login_page.dart';
import 'package:flashcard/presentation/login/pages/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'infrastructure/routes/routes.dart';

void main() {
  runApp(FlashCards());
}

class FlashCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashCards',
      //home: LoginPage(),
      home: LoginPage(),
      // routes: routes,
      onGenerateRoute: generateRoutes,
    );
  }
}
