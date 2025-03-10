import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';

class SingleLineTextFormField extends StatelessWidget {
  const SingleLineTextFormField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '入力してください';
        }
        return null;
      },
      autocorrect: false,
      enableSuggestions: false,
      decoration: textFieldDecoration(label),
    );
  }
}
