import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';

class UsernameTextFormField extends StatelessWidget {
  const UsernameTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '入力してください';
        }
        if (value.trim().isEmpty) {
          return '空白のみは設定できません';
        }
        return null;
      },
      maxLength: 12,
      keyboardType: TextInputType.name,
      autocorrect: false,
      enableSuggestions: false,
      decoration: textFieldDecoration('名前'),
    );
  }
}
