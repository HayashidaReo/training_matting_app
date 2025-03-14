import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/decoration/none_border_text_field_decoration.dart';

class TalkMessageTextField extends StatelessWidget {
  const TalkMessageTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIconOnPressed,
    required this.prefixIcon,
    required this.suffixIconOnPressed,
    required this.suffixIcon,
  });

  final String label;
  final TextEditingController controller;
  final VoidCallback prefixIconOnPressed;
  final Icon prefixIcon;
  final VoidCallback suffixIconOnPressed;
  final Icon suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 上部に横棒を配置
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 1,
            color: defaultColors.talkRoomSendMessageFieldBorderColor,
          ),
        ),
        TextField(
          minLines: 1,
          maxLines: 9,
          keyboardType: TextInputType.multiline,
          controller: controller,
          decoration: noneBorderTextFieldDecoration(
            label: label,
            prefixIconOnPressed: prefixIconOnPressed,
            prefixIcon: prefixIcon,
            suffixIconOnPressed: suffixIconOnPressed,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
