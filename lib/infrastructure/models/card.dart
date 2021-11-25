import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flutter/cupertino.dart';

class CardModel {
  final String id;
  final String front;
  final String back;
  final Color color;

  CardModel(
      {required this.id,
      required this.front,
      required this.back,
      required this.color});

  static CardModel fromJson(Map<String, dynamic> json) => CardModel(
        id: json["_id"],
        front: json["front"],
        back: json["back"],
        color: mainColor,
      );
}
