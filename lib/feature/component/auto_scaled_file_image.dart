import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 画像の小さい方の辺が targetMinSide になるように自動スケーリングするウィジェット（File 版）
class AutoScaledFileImage extends HookWidget {
  final File imageFile;
  final double targetMinSide; // 小さいほうの辺サイズ
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AutoScaledFileImage({
    super.key,
    required this.imageFile,
    this.targetMinSide = 170,
    this.fit = BoxFit.contain,
    this.borderRadius,
  });

  /// ImageProvider で画像サイズを取得する
  Future<Size> _getImageSize(File file) async {
    final Completer<Size> completer = Completer();
    final Image image = Image.file(file);
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
    // useMemoized で画像サイズ取得の Future をキャッシュ
    final imageSizeFuture = useMemoized(() => _getImageSize(imageFile), [
      imageFile,
    ]);
    final snapshot = useFuture(imageSizeFuture);

    // 画像サイズがまだ取得できていない場合は、枠だけ表示
    if (!snapshot.hasData) {
      return Container(
        width: targetMinSide,
        height: targetMinSide,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.grey.shade300, // ローディング時の背景色
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    final originalSize = snapshot.data!;
    // 画像の幅と高さのうち、短い方を targetMinSide にするためのスケール
    final scale =
        targetMinSide /
        (originalSize.width < originalSize.height
            ? originalSize.width
            : originalSize.height);
    final displayWidth = originalSize.width * scale;
    final displayHeight = originalSize.height * scale;

    Widget imageWidget = Image.file(
      imageFile,
      width: displayWidth,
      height: displayHeight,
      fit: fit,
    );

    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}
