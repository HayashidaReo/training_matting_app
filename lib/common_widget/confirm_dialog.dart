import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/config/utils/margin/width_margin_sized_box.dart';

void showConfirmDialog({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return ConfirmDialog(text: text, onPressed: onPressed);
    },
  );
}

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '確認',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: FontSize.large,
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
              fontSize: FontSize.normal,
              color: defaultColors.dialogBodyTextColor,
            ),
          ),
          HeightMarginSizedBox.small,
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  context.pop();
                },
                text: 'いいえ',
                isColorReversed: true,
              ),
            ),
            WidthMarginSizedBox.small,
            Expanded(
              child: CustomButton(
                onPressed: () {
                  onPressed();
                },
                text: 'OK',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
