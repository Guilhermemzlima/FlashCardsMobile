import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shape: Border(bottom: BorderSide(color: mainColor, width: 1)),
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(
        title,
        style: titleStyleBold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
