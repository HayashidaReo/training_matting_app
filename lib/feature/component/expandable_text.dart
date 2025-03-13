import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    final isExpanded = useState<bool>(false);

    return LayoutBuilder(
      builder: (context, constraints) {
        // TextPainter でテキストのサイズを測定し、オーバーフローしているかを判定する
        final TextSpan textSpan = TextSpan(text: text, style: style);
        final TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);
        final computedOverflow = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: style,
              maxLines: isExpanded.value ? null : maxLines,
              overflow:
                  isExpanded.value
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
            ),
            if (!isExpanded.value && computedOverflow)
              TextButton(
                onPressed: () => isExpanded.value = true,
                child: const Text('さらに表示...'),
              ),
          ],
        );
      },
    );
  }
}
