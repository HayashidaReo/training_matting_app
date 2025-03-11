import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';

class TalkMessageTextField extends StatelessWidget {
  const TalkMessageTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 9,
      controller: controller,
      decoration: textFieldDecoration(label),
    );
  }
}
