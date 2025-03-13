import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';

class EnlargedImagePage extends ConsumerWidget {
  const EnlargedImagePage({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          color: defaultColors.appBackColor,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: defaultColors.talkRoomErrorImageBackColor,
                    ),
                    child: const Icon(Icons.image_not_supported_rounded),
                  ),
            ),
          ),
        ),
        Positioned(top: 60, left: 0, child: BackButton()),
      ],
    );
  }
}
