import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';

InputDecoration textFieldDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(
      color: defaultColors.textFiledLabelColor,
      fontSize: FontSize.normal,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: defaultColors.textFiledUnfocusedBorderColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: defaultColors.textFiledUnfocusedBorderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: defaultColors.textFiledFocusedBorderColor),
    ),
  );
}
