import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

class BreakableTextFormField extends StatelessWidget {
  const BreakableTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLength,
  });

  final String label;
  final TextEditingController controller;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: 7,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '入力してください';
        }
        if (value.trim().isEmpty) {
          return '空白のみは設定できません';
        }
        final int newLineCount = '\n'.allMatches(value).length;
        if (newLineCount >= 10) {
          return '改行は10回以内にしてください';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: defaultColors.labelLightBlueColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: defaultColors.blueBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultColors.blueBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultColors.blueBorderColor),
        ),
      ),
    );
  }
}
