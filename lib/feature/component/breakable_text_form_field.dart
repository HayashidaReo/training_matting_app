import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';

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
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '入力してください';
        }
        if (value.trim().isEmpty) {
          return '空白のみは設定できません';
        }
        return null;
      },
      decoration: textFieldDecoration(label),
    );
  }
}
