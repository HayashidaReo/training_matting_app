import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

// 圧縮処理の例
Future<File?> compressImage(File file, String targetPath) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 70, // 0〜100の値。数値が低いほど画質は下がる
    format: CompressFormat.jpeg,
  );
  return result != null ? File(result.path) : null;
}
