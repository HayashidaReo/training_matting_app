import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:path_provider/path_provider.dart';

/// オンラインの画像をダウンロードして一時ディレクトリに保存し、File を返す
/// 成功した場合はダウンロードした画像の [File]、失敗した場合は null
Future<void> downloadImage(String imageUrl) async {
  try {
    // HTTPリクエストで画像を取得
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // レスポンスボディをバイト配列として取得
      final bytes = response.bodyBytes;
      // 端末の一時ディレクトリパスを取得
      final tempDir = await getTemporaryDirectory();
      // 保存先のファイルを作成
      final file = File(
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpeg',
      );
      // バイト配列を書き込み
      await file.writeAsBytes(bytes);
      Uint8List buffer = await file.readAsBytes();
      await ImageGallerySaver.saveImage(buffer);
      showToast('画像を保存しました');
      return;
    }
    showToast('画像の保存に失敗しました');
    return;
  } catch (e) {
    showToast('画像の保存に失敗しました');
    return;
  }
}
