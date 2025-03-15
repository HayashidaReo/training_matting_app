import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:matching_app/config/utils/color/colors.dart';

/// 画像を横幅いっぱいに広げて表示するウィジェット（アスペクト比保持）
class AutoScaledNetworkImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const AutoScaledNetworkImage({
    super.key,
    required this.imageUrl,
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
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: constraints.maxWidth,
              height: constraints.maxWidth * 0.7,
              fit: BoxFit.cover,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Container(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: defaultColors.talkRoomLoadingImageBackColor,
                    ),
                    child: Center(child: CupertinoActivityIndicator()),
                  ),
              errorWidget:
                  (context, url, error) => Container(
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
