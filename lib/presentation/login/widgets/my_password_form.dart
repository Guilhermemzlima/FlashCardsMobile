import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class MyPasswordForm extends StatelessWidget {
  final TextEditingController _controller;
  final String _labelText;
  final int _maxLines;
  final int _maxLength;
  final TextInputType _keyboardType;
  final bool _isCounter;
  bool _isObscure;

  MyPasswordForm(this._controller, this._labelText, this._maxLines,
      this._maxLength, this._keyboardType, this._isCounter, this._isObscure);

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
        obscureText: _isObscure,
        decoration: InputDecoration(
          labelText: _labelText,
          labelStyle: subTitleStyleBold,
          counterText: _isCounter == true ? null : '',
          counterStyle: subTitleStyleBold,
          suffixIcon: IconButton(
            color: Colors.black,
            icon: _isObscure
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () => _isObscure = !_isObscure,
          ),
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