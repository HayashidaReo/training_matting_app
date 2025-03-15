import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/feature/component/hide_button_on_image.dart';
import 'package:matching_app/function/download_image.dart';

class EnlargedNetworkImagePage extends ConsumerWidget {
  const EnlargedNetworkImagePage({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      direction: DismissDirection.vertical,
      onDismissed: (_) => context.pop(),
      key: const Key('key'),
      child: Stack(
        children: [
          Container(
            color: defaultColors.enlargedImageBackColor,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => Container(
                      decoration: BoxDecoration(
                        color: defaultColors.talkRoomLoadingImageBackColor,
                      ),
                      child: Center(child: CupertinoActivityIndicator()),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: defaultColors.talkRoomErrorImageBackColor,
                      ),
                      child: const Icon(Icons.image_not_supported_rounded),
                    ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            child: HideButtonOnImage(onPressed: () => context.pop(), size: 50),
          ),
          Positioned(
            top: 60,
            right: 0,

            child: HideButtonOnImage(
              onPressed: () => downloadImage(imageUrl),
              size: 50,
              icon: Icons.save,
            ),
          ),
        ],
      ),
    );
  }
}
