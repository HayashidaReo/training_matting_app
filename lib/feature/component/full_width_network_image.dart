import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:matching_app/config/utils/color/colors.dart';

/// 画像を横幅いっぱいに広げて表示するウィジェット（アスペクト比保持）
class FullWidthNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const FullWidthNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          width: constraints.maxWidth,
          height: constraints.maxWidth * 0.7,
          fit: fit,
          progressIndicatorBuilder:
              (context, url, downloadProgress) => Container(
                width: constraints.maxWidth,
                height: constraints.maxWidth * 0.7,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: defaultColors.talkRoomLoadingImageBackColor,
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
              ),
          errorWidget:
              (context, url, error) => Container(
                width: constraints.maxWidth,
                height: constraints.maxWidth * 0.7,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: defaultColors.talkRoomErrorImageBackColor,
                ),
                child: const Icon(Icons.image_not_supported_rounded),
              ),
        );
      },
    );
  }
}
