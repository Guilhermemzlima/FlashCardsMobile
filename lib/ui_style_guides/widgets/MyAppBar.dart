import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(this.appBarTitle);

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: black, //change your color here
      ),
      shape: Border(bottom: BorderSide(color: mainColor, width: 1)),
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(
        appBarTitle,
        style: titleStyleBold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
