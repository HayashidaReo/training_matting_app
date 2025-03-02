import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
    this.readOnly = false,
    required this.label,
  });

  final TextEditingController controller;
  final bool readOnly;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '入力してください';
        }
        // メールアドレスの正規表現
        final RegExp emailRegExp = RegExp(
          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
        );
        if (!emailRegExp.hasMatch(value)) {
          return '正しいメールアドレスを入力してください';
        }
        return null;
      },
      readOnly: readOnly,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      enableSuggestions: false,
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
