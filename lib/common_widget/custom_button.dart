import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isColorReversed = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isColorReversed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              !isColorReversed
                  ? defaultColors.mainButtonBackPinkColor
                  : defaultColors.subButtonBackWhiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: defaultColors.buttonBorderPinkColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            text,
            style: TextStyle(
              color:
                  !isColorReversed
                      ? defaultColors.mainButtonTextWhiteColor
                      : defaultColors.subButtonTextPinkColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
