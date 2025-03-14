import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

class HideButtonOnImage extends StatelessWidget {
  const HideButtonOnImage({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: defaultColors.onImageIconButtonBackColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.close_rounded,
            color: defaultColors.onImageIconButtonFrontColor,
            size: 14,
          ),
        ),
      ),
    );
  }
}
