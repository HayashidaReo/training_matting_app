import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';

IgnorePointer badgeCountWidget(WidgetRef ref, int count) {
  return IgnorePointer(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: defaultColors.massageBadgeBackColor,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(minWidth: 16, minHeight: 16),
      child: Text(
        count.toString(),
        style: TextStyle(
          color: defaultColors.massageBadgeTextColor,
          fontSize: FontSize.small,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
