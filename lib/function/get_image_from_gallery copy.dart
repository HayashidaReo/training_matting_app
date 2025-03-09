import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';

/// 画像を選択するピッカーを表示する関数
/// 画像が選択された場合は、選択された画像を返す
Future<File?> getImageFromGallery() async {
  showLoadingDialog('取得中...');
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  hideLoadingDialog();
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}
