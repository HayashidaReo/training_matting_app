import 'dart:io';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

/// 画像を横幅いっぱいに広げて表示するウィジェット（アスペクト比保持）
/// こちらは File を使ったバージョンです
class FullWidthFileImage extends StatelessWidget {
  final File imageFile;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const FullWidthFileImage({
    super.key,
    required this.imageFile,
    this.fit = BoxFit.cover,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Image.file(
            imageFile,
            width: constraints.maxWidth,
            height: constraints.maxWidth * 0.7,
            fit: fit,
            errorBuilder:
                (context, error, stackTrace) => Container(
                  width: constraints.maxWidth,
                  height: constraints.maxWidth * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: defaultColors.talkRoomErrorImageBackColor,
                  ),
                  child: const Icon(Icons.image_not_supported_rounded),
                ),
          ),
        );
      },
    );
  }
}
