import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// 画像の小さい方の辺がtargetMinSideになるように自動スケーリングするウィジェット
class AutoScaledImage extends HookWidget {
  final String imageUrl;
  final double targetMinSide; // 小さいほうの辺サイズ
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AutoScaledImage({
    super.key,
    required this.imageUrl,
    this.targetMinSide = 170,
    this.fit = BoxFit.contain,
    this.borderRadius,
  });

  /// ImageProviderで画像サイズを取得する
  Future<Size> _getImageSize(String url) async {
    final Completer<Size> completer = Completer();
    final Image image = Image.network(url);
    image.image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener(
            (ImageInfo info, bool _) {
              final myImage = info.image;
              completer.complete(
                Size(myImage.width.toDouble(), myImage.height.toDouble()),
              );
            },
            onError: (error, stackTrace) {
              completer.completeError(error, stackTrace);
            },
          ),
        );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    // useMemoizedで画像サイズ取得のFutureをキャッシュ
    final imageSizeFuture = useMemoized(() => _getImageSize(imageUrl), [
      imageUrl,
    ]);
    final snapshot = useFuture(imageSizeFuture);

    if (snapshot.hasError) {
      return const Icon(Icons.error);
    }
    if (!snapshot.hasData) {
      return SizedBox(
        width: targetMinSide,
        height: targetMinSide,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    final originalSize = snapshot.data!;
    // 画像の幅と高さのうち、短い方をtargetMinSideにするためのスケール
    final scale =
        targetMinSide /
        (originalSize.width < originalSize.height
            ? originalSize.width
            : originalSize.height);
    final displayWidth = originalSize.width * scale;
    final displayHeight = originalSize.height * scale;

    Widget imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      width: displayWidth,
      height: displayHeight,
      fit: fit,
      progressIndicatorBuilder:
          (context, url, downloadProgress) => SizedBox(
            width: displayWidth,
            height: displayHeight,
            child: Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
            ),
          ),
      errorWidget:
          (context, url, error) => SizedBox(
            width: displayWidth,
            height: displayHeight,
            child: const Icon(Icons.image_not_supported_rounded),
          ),
    );

    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}
