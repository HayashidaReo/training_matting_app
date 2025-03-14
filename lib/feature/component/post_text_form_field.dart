import 'package:flutter/material.dart';

class PostTextFormField extends StatelessWidget {
  const PostTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLength,
    this.focusNode,
    required this.textLength,
  });

  final String label;
  final TextEditingController controller;
  final int? maxLength;
  final FocusNode? focusNode;
  final ValueNotifier<int> textLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      minLines: 1,
      maxLines: 7,
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.multiline,
      onChanged: (value) {
        textLength.value = value.length;
      },
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
