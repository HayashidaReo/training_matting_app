import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/user/controller/storage_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';
import 'package:matching_app/function/get_image_from_gallery.dart';

class EditMyIconPage extends HookConsumerWidget {
  const EditMyIconPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<File?> uploadedImageFile = useState(null);

    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ref
                .watch(watchMyUserDataControllerProvider)
                .when(
                  data: (UserData? myUserData) {
                    if (myUserData == null) {
                      return const Text('ユーザー情報が取得できませんでした。');
                    }
                    if (uploadedImageFile.value != null) {
                      return CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(uploadedImageFile.value!),
                        onBackgroundImageError: (exception, stackTrace) {
                          debugPrint("画像読み込みエラー: $exception");
                        },
                      );
                    } else {
                      if (myUserData.iconImageUrl == '') {
                        return InkWell(
                          onTap: () async {
                            final uploadResult = await getImageFromGallery();
                            if (uploadResult != null) {
                              uploadedImageFile.value = uploadResult;
                            }
                          },
                          child: const Icon(Icons.account_circle, size: 100),
                        );
                      } else {
                        return InkWell(
                          onTap: () async {
                            final uploadResult = await getImageFromGallery();
                            if (uploadResult != null) {
                              uploadedImageFile.value = uploadResult;
                            }
                          },
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: myUserData.iconImageUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (
                                context,
                                url,
                                downloadProgress,
                              ) {
                                return SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.image_not_supported_rounded,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    }
                  },
                  error: (error, _) {
                    return const Text('エラーが発生しました。再度お試しください。');
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
            ref
                .watch(storageControllerProvider)
                .when(
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  error: (error, _) {
                    return const Text('エラーが発生しました。再度お試しください。');
                  },
                  data: (data) {
                    return Column(
                      children: [
                        // 画像を削除するボタン
                        ElevatedButton(
                          onPressed: () async {
                            await _deleteIcon(ref, context);
                          },
                          child: Text('削除する'),
                        ),
                        HeightMarginSizedBox.large,
                        // 画像を追加するボタン
                        ElevatedButton(
                          onPressed: () async {
                            await _addIcon(
                              uploadedImageFile.value,
                              context,
                              ref,
                            );
                          },
                          child: const Text('アイコンを変更する'),
                        ),
                      ],
                    );
                  },
                ),
          ],
        ),
      ),
    );
  }

  Future<void> _addIcon(
    File? imageFile,
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (imageFile == null) {
      showToast('画像が選択されていません');
      return;
    }
    final downloadUrl = await ref
        .read(storageControllerProvider.notifier)
        .uploadImageAndGetUrl(imageFile: imageFile);
    if (context.mounted) {
      await _updateImageUrl(ref, context, downloadUrl);
    }
    showToast('変更完了');
    return;
  }

  Future<void> _deleteIcon(WidgetRef ref, BuildContext context) async {
    await _updateImageUrl(ref, context, '');
    //storageの削除
    await ref.read(storageControllerProvider.notifier).deleteImage();
    showToast('削除完了');

    return;
  }

  Future<void> _updateImageUrl(
    WidgetRef ref,
    BuildContext context,
    String downloadUrl,
  ) async {
    final UserData? myUserData =
        await ref.read(userControllerProvider.notifier).getUser();
    if (myUserData == null) {
      if (context.mounted) {
        showToast('ユーザー情報が取得できませんでした');
      }
      return;
    }

    await ref
        .read(userControllerProvider.notifier)
        .updateUserIcon(myUserData, downloadUrl);
    return;
  }
}
