import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/component/breakable_text_form_field.dart';
import 'package:matching_app/feature/component/un_focus.dart';
import 'package:matching_app/function/get_image_from_gallery.dart';

class AddPostPage extends HookConsumerWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController bodyController = useTextEditingController();
    final selectedImage = useState<File?>(null);

    Widget? imageWidget;
    if (selectedImage.value != null) {
      imageWidget = Stack(
        children: [
          Image.file(
            selectedImage.value!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                selectedImage.value = null;
              },
              child: Container(
                color: Colors.black.withValues(alpha: 0.5),
                child: Icon(Icons.close, color: defaultColors.mainTextColor),
              ),
            ),
          ),
        ],
      );
    } else {
      imageWidget = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.image, color: defaultColors.blueTextColor),
          Text('画像を添付'),
        ],
      );
    }

    return UnFocus(
      child: Scaffold(
        appBar: AppBar(title: const Text('postを追加')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  HeightMarginSizedBox.large,
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        BreakableTextFormField(
                          controller: bodyController,
                          maxLength: 140,
                          label: 'post内容',
                        ),
                      ],
                    ),
                  ),
                  HeightMarginSizedBox.small,
                  GestureDetector(
                    onTap: () async {
                      if (selectedImage.value != null) return;
                      selectedImage.value = await getImageFromGallery();
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),

                      child: imageWidget,
                    ),
                  ),
                  HeightMarginSizedBox.normal,
                  CustomButton(
                    text: 'postする',
                    onPressed: () async {
                      // await _addPost(
                      //   formKey,
                      //   ref,
                      //   selectedImage,
                      //   bodyController,
                      //   context,
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // TODO: ポスト保存処理を作る
  //   Future<void> _addPost(
  //     GlobalKey<FormState> formKey,
  //     WidgetRef ref,
  //     ValueNotifier<File?> selectedImage,
  //     TextEditingController bodyController,
  //     BuildContext context,
  //   ) async {
  //     final Timestamp now = Timestamp.now();
  //     if (!formKey.currentState!.validate()) {
  //       return;
  //     }
  //     showLoadingDialog('保存中...');

  //     // postIdを生成
  //     final String postId = ref.read(postRepoProvider).doc().id;

  //     String imageUrl = '';
  //     // 画像の保存
  //     if (selectedImage.value != null) {
  //       imageUrl = await ref
  //           .read(storageRepoProvider.notifier)
  //           .uploadImageAndGetUrl(
  //             collectionName: FirebaseStorageKey.postImageCollection,
  //             imageFile: selectedImage.value!,
  //             userId: ref.read(authRepoProvider)!.uid,
  //           );
  //     }

  //     // 文章の保存
  //     final Post addPostData = Post(
  //       body: bodyController.text,
  //       userId: FirebaseAuth.instance.currentUser!.uid,
  //       postId: postId,
  //       imageUrl: imageUrl,
  //       createdAt: now,
  //       updatedAt: now,
  //     );
  //     await ref.read(postRepoProvider.notifier).addPost(addPostData);
  //     hideLoadingDialog();
  //     showToast('postしました');
  //     if (context.mounted) {
  //       context.pop();
  //     }
  //     return;
  //   }
}
