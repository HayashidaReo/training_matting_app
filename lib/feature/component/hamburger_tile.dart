import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';

class HamburgerTile extends StatelessWidget {
  const HamburgerTile({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
  });

  final VoidCallback onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            buttonTitle,
            style: TextStyle(
              color: defaultColors.hamburgerMenuTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            onPressed();
          },
        ),
        HeightMarginSizedBox.normal,
      ],
    );
  }
}
