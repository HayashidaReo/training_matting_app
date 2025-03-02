import 'package:flutter/material.dart';
import 'package:matching_app/routing/app_router.dart';

void showLoadingDialog(String message) {
  showDialog(
    context: rootNavigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(fontSize: 16.0),
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
