import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isColorReversed = false,
    this.leftIcon,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isColorReversed;
  final IconData? leftIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              !isColorReversed
                  ? defaultColors.mainButtonBackColor
                  : defaultColors.subButtonBackColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: defaultColors.buttonBorderColor, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (leftIcon != null)
                  ? Icon(
                    leftIcon,
                    color:
                        !isColorReversed
                            ? defaultColors.mainButtonTextColor
                            : defaultColors.subButtonTextColor,
                  )
                  : SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color:
                        !isColorReversed
                            ? defaultColors.mainButtonTextColor
                            : defaultColors.subButtonTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
