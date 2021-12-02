import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flutter/material.dart';

class SquareColorPicker extends StatelessWidget {
  final Color color;

  SquareColorPicker(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 30,
        child: InkWell(
          onTap: () => print(color),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: black, width: 2),
            color: color,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
