import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/enum/image_quality_enum.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/hide_button_on_image.dart';
import 'package:matching_app/feature/user/controller/storage_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';
import 'package:matching_app/function/get_image_from_gallery.dart';

class EditMyIconPage extends HookConsumerWidget {
  const EditMyIconPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<File?> uploadedImageFile = useState(null);
    final ValueNotifier<bool> isIconDeleted = useState(false);

    return Scaffold(
      appBar: AppBar(title: const Text('アイコン設定')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeightMarginSizedBox.normal,
            ref
                .watch(watchMyUserDataControllerProvider)
                .when(
                  data: (UserData? myUserData) {
                    if (myUserData == null) {
                      return const Text('ユーザー情報が取得できませんでした。');
                    }
                    if (uploadedImageFile.value != null) {
                      // 画像が選択されている場合
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              final uploadResult = await getImageFromGallery(
                                ImageQuality.icon.quality,
                              );
                              if (uploadResult != null) {
                                uploadedImageFile.value = uploadResult;
                              }
                            },
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  uploadedImageFile.value!,
                                ),
                                onBackgroundImageError: (
                                  exception,
                                  stackTrace,
                                ) {
                                  debugPrint("画像読み込みエラー: $exception");
                                },
                              ),
                            ),
                          ),
                          // 削除ボタン
                          Positioned(
                            top: 0,
                            right: 0,
                            child: HideButtonOnImage(
                              size: 50,
                              onPressed: () async {
                                if (myUserData.iconImageUrl != '') {
                                  isIconDeleted.value = true;
                                }
                                uploadedImageFile.value = null;
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      // 画像が選択されていない場合
                      if (myUserData.iconImageUrl != '' &&
                          !isIconDeleted.value) {
                        // アイコンが設定されている場合
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                final uploadResult = await getImageFromGallery(
                                  ImageQuality.icon.quality,
                                );
                                if (uploadResult != null) {
                                  uploadedImageFile.value = uploadResult;
                                  isIconDeleted.value = false;
                                }
                              },
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: myUserData.iconImageUrl,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: (
                                    context,
                                    url,
                                    downloadProgress,
                                  ) {
                                    return SizedBox(
                                      width: 200,
                                      height: 200,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return SizedBox(
                                      width: 200,
                                      height: 200,
                                      child: Icon(
                                        Icons.image_not_supported_rounded,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            // 削除ボタン
                            Positioned(
                              top: 0,
                              right: 0,
                              child: HideButtonOnImage(
                                size: 50,
                                onPressed: () async {
                                  uploadedImageFile.value = null;
                                  isIconDeleted.value = true;
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        // アイコンが未設定の場合
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                final uploadResult = await getImageFromGallery(
                                  ImageQuality.icon.quality,
                                );
                                if (uploadResult != null) {
                                  uploadedImageFile.value = uploadResult;
                                  isIconDeleted.value = false;
                                }
                              },
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/default_user_icon.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // 追加ボタン
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: HideButtonOnImage(
                                size: 50,
                                icon: Icons.add_outlined,
                                onPressed: () async {
                                  final uploadResult =
                                      await getImageFromGallery(
                                        ImageQuality.icon.quality,
                                      );
                                  if (uploadResult != null) {
                                    uploadedImageFile.value = uploadResult;
                                    isIconDeleted.value = false;
                                  }
                                },
                              ),
                            ),
                          ],
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
            HeightMarginSizedBox.large,

            SizedBox(
              width: 250,
              child: CustomButton(
                onPressed: () async {
                  await _addIcon(
                    uploadedImageFile.value,
                    context,
                    ref,
                    isIconDeleted.value,
                  );
                },
                text: '保存する',
              ),
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
    bool isDeleted,
  ) async {
    showLoadingDialog('保存中...');
    if (isDeleted) {
      _deleteIcon(ref, context);
      return;
    }
    if (imageFile == null) {
      showToast('新しい画像が選択されていません');
      hideLoadingDialog();
      return;
    }
    final downloadUrl = await ref
        .read(storageControllerProvider.notifier)
        .uploadImageAndGetUrl(
          folderName: FirebaseStorageKey.userIconCollection,
          imageFile: imageFile,
          docId: ref.read(currentUserControllerProvider)!.uid,
        );
    if (context.mounted) {
      await _updateImageUrl(ref, context, downloadUrl);
    }
    hideLoadingDialog();
    showToast('アイコンを変更しました');
    return;
  }

  Future<void> _deleteIcon(WidgetRef ref, BuildContext context) async {
    await _updateImageUrl(ref, context, '');
    //storageの削除
    await ref
        .read(storageControllerProvider.notifier)
        .deleteImage(
          folderName: FirebaseStorageKey.userIconCollection,
          docId: ref.read(currentUserControllerProvider)!.uid,
        );
    hideLoadingDialog();
    showToast('アイコンを削除しました');
    return;
  }

  Future<void> _updateImageUrl(
    WidgetRef ref,
    BuildContext context,
    String downloadUrl,
  ) async {
    final UserData? myUserData =
        await ref.read(userControllerProvider.notifier).getMyUserData();
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
