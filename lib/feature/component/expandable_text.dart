import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:readmore/readmore.dart';

class ExpandableText extends HookWidget {
  const ExpandableText({
    super.key,
    required this.text,
    this.style,
    this.maxLines = 7,
  });

  final String text;
  final TextStyle? style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      textAlign: TextAlign.start,
      trimLines: maxLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' さらに表示',
      trimExpandedText: ' 折りたたむ',
      style: style,
      moreStyle: style?.copyWith(color: defaultColors.readMoreTextColor),
      lessStyle: style?.copyWith(color: defaultColors.readMoreTextColor),
    );
  }
}
