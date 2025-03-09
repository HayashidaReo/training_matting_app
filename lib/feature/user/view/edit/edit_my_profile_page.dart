import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/component/breakable_text_form_field.dart';
import 'package:matching_app/feature/component/username_text_form_field.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';

class EditMyProfilePage extends HookConsumerWidget {
  const EditMyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController userNameController = useTextEditingController();
    final TextEditingController profileController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('プロフィール編集')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ref
            .watch(watchMyUserDataControllerProvider)
            .when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (error, stackTrace) => Center(
                    child: Text(
                      'エラーが発生しました',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              data: (myUserData) {
                if (myUserData == null) {
                  return const Center(
                    child: Text(
                      'ユーザーデータが取得できませんでした',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                userNameController.text = myUserData.userName;
                profileController.text = myUserData.profile;
                return Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        UsernameTextFormField(controller: userNameController),
                        HeightMarginSizedBox.normal,
                        BreakableTextFormField(
                          controller: profileController,
                          label: '自己紹介',
                          maxLength: 133,
                        ),
                        HeightMarginSizedBox.normal,

                        // DefaultButton(
                        //   buttonText: 'プロフィールを変更',
                        //   onDefaultButtonPressed: () async {
                        //     if (!formKey.currentState!.validate()) {
                        //       return;
                        //     }
                        //     showLoadingDialog('変更中...');

                        //     final UserData? myUserData =
                        //         await ref
                        //             .read(userRepoProvider.notifier)
                        //             .getMyUserData();

                        //     // ユーザー情報を更新
                        //     ref
                        //         .read(userRepoProvider.notifier)
                        //         .updateUser(
                        //           myUserData!.copyWith(
                        //             userName: userNameController.text,
                        //             profile: profileController.text,
                        //             updatedAt: Timestamp.now(),
                        //           ),
                        //         );

                        //     try {
                        //       // 画像を削除する処理
                        //       if (isImageDeleted.value) {
                        //         // 画像を削除
                        //         ref
                        //             .read(storageRepoProvider.notifier)
                        //             .deleteImage(
                        //               collectionName:
                        //                   FirebaseStorageKey
                        //                       .userImageCollection,
                        //               userId: ref.read(authRepoProvider)!.uid,
                        //             );
                        //         // userDataを更新
                        //         ref
                        //             .watch(userRepoProvider.notifier)
                        //             .updateUser(
                        //               myUserData.copyWith(
                        //                 imageUrl: '',
                        //                 updatedAt: Timestamp.now(),
                        //               ),
                        //             );
                        //       }

                        //       // 画像を保存する処理
                        //       if (uploadedImageFile.value != null) {
                        //         // 画像をアップロード
                        //         imageUrlState.value = await ref
                        //             .read(storageRepoProvider.notifier)
                        //             .uploadImageAndGetUrl(
                        //               collectionName:
                        //                   FirebaseStorageKey
                        //                       .userImageCollection,
                        //               imageFile: uploadedImageFile.value!,
                        //               userId: ref.read(authRepoProvider)!.uid,
                        //             );
                        //         // userDataを更新
                        //         ref
                        //             .read(userRepoProvider.notifier)
                        //             .updateUser(
                        //               myUserData.copyWith(
                        //                 imageUrl: imageUrlState.value,
                        //                 updatedAt: Timestamp.now(),
                        //               ),
                        //             );
                        //       }
                        //     } catch (e) {
                        //       CloseOnlyDialog(
                        //         text: e.toString(),
                        //         title: 'エラーが発生しました',
                        //       );
                        //     }
                        //     hideLoadingDialog();
                        //     if (context.mounted) {
                        //       context.pop();
                        //     }
                        //     showToast('プロフィールを変更しました');
                        //   },
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
