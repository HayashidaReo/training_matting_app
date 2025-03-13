import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:path_provider/path_provider.dart';

/// 画像を選択するピッカーを表示する関数
/// 画像が選択された場合は、選択された画像を返す
Future<File?> getImageFromGallery(int quality) async {
  showLoadingDialog('取得中...');
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  File? compressedFile;
  // 圧縮
  if (pickedFile != null) {
    final targetPath = await _getTargetPath();
    compressedFile = await _compressImage(
      File(pickedFile.path),
      targetPath,
      quality,
    );
  }

  hideLoadingDialog();
  if (compressedFile != null) {
    return File(compressedFile.path);
  }
  return null;
}

// 圧縮処理
Future<File?> _compressImage(File file, String targetPath, int quality) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: quality, // 0〜100の値。数値が低いほど画質は下がる
    format: CompressFormat.jpeg,
  );
  return result != null ? File(result.path) : null;
}

// 圧縮後の画像を保存する一時パスを生成する
Future<String> _getTargetPath() async {
  final tempDir = await getTemporaryDirectory();
  final targetPath =
      '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpeg';
  return targetPath;
}
