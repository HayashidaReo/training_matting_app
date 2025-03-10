import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.controller,
    required this.visible,
    required this.suffixIcon,
  });

  final TextEditingController controller;
  final bool visible;
  final Widget suffixIcon;

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
        if (value.length < 6) {
          return '6文字以上で入力してください';
        }
        return null;
      },
      decoration: textFieldDecoration('password'),
      obscureText: visible,
    );
  }
}
