import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

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
            height: 1, // 線の太さ
            color: defaultColors.talkRoomSendMessageFieldBorderColor,
          ),
        ),
        TextField(
          minLines: 1,
          maxLines: 9,
          keyboardType: TextInputType.multiline,
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            prefixIcon: IconButton(
              onPressed: prefixIconOnPressed,
              icon: prefixIcon,
            ),
            suffixIcon: IconButton(
              onPressed: suffixIconOnPressed,
              icon: suffixIcon,
            ),
            filled: true,
            fillColor: defaultColors.talkRoomSendMessageFieldBackColor,
            // 枠線を消し、角丸にする
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.zero, // 上下左右の余白を調整
          ),
        ),
      ],
    );
  }
}
