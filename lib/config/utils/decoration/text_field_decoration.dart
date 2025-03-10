import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

InputDecoration textFieldDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: defaultColors.textFiledLabelColor),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: defaultColors.textFiledBorderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: defaultColors.textFiledBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: defaultColors.textFiledBorderColor),
    ),
  );
}
