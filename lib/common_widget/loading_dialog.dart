import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/routing/app_router.dart';

void showLoadingDialog(String message) {
  showDialog(
    context: rootNavigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: defaultColors.appBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              HeightMarginSizedBox.normal,
              Text(
                message,
                style: TextStyle(fontSize: FontSize.normal),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}

void hideLoadingDialog() {
  if (rootNavigatorKey.currentState != null &&
      rootNavigatorKey.currentState!.canPop()) {
    rootNavigatorKey.currentState!.pop();
  }
}
