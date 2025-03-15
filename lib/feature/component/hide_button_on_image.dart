import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

class HideButtonOnImage extends StatelessWidget {
  const HideButtonOnImage({
    super.key,
    required this.onPressed,
    required this.size,
    this.icon,
  });

  final VoidCallback onPressed;
  final double size;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: defaultColors.onImageIconButtonBackColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon ?? Icons.close_rounded,
            color: defaultColors.onImageIconButtonFrontColor,
            size: size / 2,
          ),
        ),
      ),
    );
  }
}
