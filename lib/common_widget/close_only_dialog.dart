import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';

void showCloseOnlyDialog(BuildContext context, title, text) {
  showDialog(
    context: context,
    builder: (context) {
      return CloseOnlyDialog(title: title, text: text);
    },
  );
}

class CloseOnlyDialog extends StatelessWidget {
  const CloseOnlyDialog({super.key, required this.title, required this.text});

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: defaultColors.dialogTitleColor,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: defaultColors.dialogBodyTextColor,
            ),
          ),
          HeightMarginSizedBox.small,
        ],
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text('閉じる'),
          ),
        ),
      ],
    );
  }
}
