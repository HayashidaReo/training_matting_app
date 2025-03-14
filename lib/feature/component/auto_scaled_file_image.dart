import 'dart:io';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

/// 画像を横幅いっぱいに広げて表示するウィジェット（アスペクト比保持）
/// こちらは File を使ったバージョンです
class AutoScaledFileImage extends StatelessWidget {
  final File imageFile;
  final VoidCallback onTap;

  const AutoScaledFileImage({
    super.key,
    required this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              imageFile,
              width: constraints.maxWidth,
              height: constraints.maxWidth * 0.7,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: defaultColors.talkRoomErrorImageBackColor,
                    ),
                    child: const Icon(Icons.image_not_supported_rounded),
                  ),
            ),
          ),
        );
      },
    );
  }
}
