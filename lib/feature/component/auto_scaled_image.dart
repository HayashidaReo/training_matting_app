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

    // 画像サイズがまだ取得できていない場合は、枠だけ表示
    if (!snapshot.hasData) {
      return Container(
        width: targetMinSide,
        height: targetMinSide,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.grey[300], // ローディング時の背景色
        ),
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
          (context, url, downloadProgress) => Container(
            width: displayWidth,
            height: displayHeight,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Colors.grey[300], // ローディング時の背景色
            ),
            child: Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
            ),
          ),
      errorWidget:
          (context, url, error) => Container(
            width: displayWidth,
            height: displayHeight,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Colors.grey[400], // エラー時の背景色
            ),
            child: const Icon(Icons.image_not_supported_rounded),
          ),
    );

    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}
