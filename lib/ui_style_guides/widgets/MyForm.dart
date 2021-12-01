import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flutter/services.dart';

class MyForm extends StatelessWidget {
  final TextEditingController _controller;
  final String _labelText;
  final int _maxLines;
  final int _maxLength;
  final TextInputType _keyboardType;
  final bool _isCounter;

  MyForm(this._controller, this._labelText, this._maxLines, this._maxLength,
      this._keyboardType, this._isCounter);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _controller,
        maxLength: _maxLength,
        cursorColor: Colors.black,
        cursorWidth: 4,
        keyboardType: _keyboardType,
        maxLines: _maxLines,
        decoration: InputDecoration(
          labelText: _labelText,
          labelStyle: subTitleStyleBold,
          counterText: _isCounter == true ? null : '',
          counterStyle: subTitleStyleBold,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.all(25),
          filled: true,
          fillColor: mainColor,
          focusColor: hoverMainColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}