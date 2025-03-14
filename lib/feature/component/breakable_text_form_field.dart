import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';

class BreakableTextFormField extends StatelessWidget {
  const BreakableTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLength,
    this.focusNode,
  });

  final String label;
  final TextEditingController controller;
  final int? maxLength;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: 7,
      controller: controller,
      focusNode: focusNode,
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
      decoration: InputDecoration(
        // ツイッター投稿画面のようにシンプルなヒントテキストを表示
        hintText: 'いまどうしてる？',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),

        // カウンター（入力文字数の表示）を非表示にする
        counterText: '',

        // 枠線を消してフラットな見た目に
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,

        // テキストと上下左右の余白を調整
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      style: const TextStyle(fontSize: 18),
    );
  }
}
