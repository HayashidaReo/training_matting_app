import 'package:flutter/material.dart';
import 'package:matching_app/function/hide_keyboard.dart';

/// キーボード以外の場所をタップすると、キーボードを閉じるウィジェット
class UnFocus extends StatelessWidget {
  const UnFocus({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: child,
    );
  }
}
