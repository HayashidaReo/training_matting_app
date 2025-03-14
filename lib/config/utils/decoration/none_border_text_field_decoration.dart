import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

InputDecoration noneBorderTextFieldDecoration({
  required String label,
  required VoidCallback? prefixIconOnPressed,
  required Widget prefixIcon,
  required VoidCallback? suffixIconOnPressed,
  required Widget suffixIcon,
}) {
  return InputDecoration(
    hintText: label,
    prefixIcon: IconButton(onPressed: prefixIconOnPressed, icon: prefixIcon),
    suffixIcon: IconButton(onPressed: suffixIconOnPressed, icon: suffixIcon),
    filled: true,
    fillColor: defaultColors.talkRoomSendMessageFieldBackColor,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    ),
    contentPadding: EdgeInsets.zero,
  );
}
