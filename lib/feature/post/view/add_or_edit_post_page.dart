import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/image_quality_enum.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/component/auto_scaled_file_image.dart';
import 'package:matching_app/feature/component/auto_scaled_network_image.dart';
import 'package:matching_app/feature/component/breakable_text_form_field.dart';
import 'package:matching_app/feature/component/un_focus.dart';
import 'package:matching_app/feature/post/controller/post_controller.dart';
import 'package:matching_app/feature/post/model/post.dart';
import 'package:matching_app/function/get_image_from_gallery.dart';

class AddOrEditPostPage extends HookConsumerWidget {
  const AddOrEditPostPage({super.key, this.postId});

  final String? postId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = postId != null;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController bodyController = useTextEditingController();
    final ValueNotifier<File?> selectedImage = useState<File?>(null);
    final ValueNotifier<bool> isImageDeleted = useState(false);

    if (isEditMode) {
      return ref
          .watch(watchPostControllerProvider(postId!))
          .when(
            error: (error, _) {
              return Text('エラーが発生しました');
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            data: (postData) {
              if (postData == null) {
                return Text('データが存在しません');
              }
              bodyController.text = postData.body;

              return AddOrEditPostForm(
                formKey: formKey,
                bodyController: bodyController,
                isImageDeleted: isImageDeleted,
                selectedImage: selectedImage,
                isEditMode: isEditMode,
                ref: ref,
                postData: postData,
              );
            },
          );
    } else {
      return AddOrEditPostForm(
        formKey: formKey,
        bodyController: bodyController,
        isImageDeleted: isImageDeleted,
        selectedImage: selectedImage,
        isEditMode: isEditMode,
        ref: ref,
      );
    }
  }
}

class AddOrEditPostForm extends HookWidget {
  const AddOrEditPostForm({
    super.key,
    required this.formKey,
    required this.bodyController,
    required this.isImageDeleted,
    required this.selectedImage,
    required this.isEditMode,
    required this.ref,
    this.postData,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController bodyController;
  final ValueNotifier<bool?> isImageDeleted;
  final ValueNotifier<File?> selectedImage;
  final bool isEditMode;
  final WidgetRef ref;
  final Post? postData;

  @override
  Widget build(BuildContext context) {
    final imageUrl = useState<String>(postData?.imageUrl ?? '');
    Widget imageWidget;
    if (selectedImage.value != null) {
      imageWidget = Stack(
        children: [
          AutoScaledFileImage(imageFile: selectedImage.value!),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                if (imageUrl.value != '') {
                  isImageDeleted.value = true;
                }
                selectedImage.value = null;
              },
              child: Container(
                color: defaultColors.addPostImageCloseButtonBackColor,
                child: Icon(
                  Icons.close,
                  color: defaultColors.mainButtonTextWhiteColor,
                ),
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
        appBar: AppBar(title: Text(isEditMode ? 'ポスト編集' : 'ポスト投稿')),
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
                      await _showImagePicker(selectedImage);
                    },
                    child:
                        (selectedImage.value != null)
                            ? imageWidget
                            : (imageUrl.value != '')
                            ? Stack(
                              children: [
                                AutoScaledNetworkImage(
                                  imageUrl: imageUrl.value,
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (imageUrl.value != '') {
                                        isImageDeleted.value = true;
                                      }
                                      selectedImage.value = null;
                                      imageUrl.value = '';
                                    },
                                    child: Container(
                                      color:
                                          defaultColors
                                              .addPostImageCloseButtonBackColor,
                                      child: Icon(
                                        Icons.close,
                                        color:
                                            defaultColors
                                                .mainButtonTextWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                            : imageWidget,
                  ),
                  HeightMarginSizedBox.normal,
                  CustomButton(
                    text: isEditMode ? '更新する' : 'postする',
                    onPressed: () async {
                      if (isEditMode) {
                        await _editPost(
                          formKey,
                          ref,
                          bodyController,
                          selectedImage,
                          context,
                          postData!,
                          imageUrl.value,
                          isImageDeleted.value!,
                        );
                      } else {
                        await _addPost(
                          formKey,
                          ref,
                          bodyController,
                          selectedImage,
                          context,
                        );
                      }
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

  Future<void> _showImagePicker(ValueNotifier<File?> selectedImage) async {
    if (selectedImage.value != null) return;
    selectedImage.value = await getImageFromGallery(ImageQuality.post.quality);

    isImageDeleted.value = false;

    return;
  }

  Future<void> _addPost(
    GlobalKey<FormState> formKey,
    WidgetRef ref,
    TextEditingController bodyController,
    ValueNotifier<File?> selectedImage,
    BuildContext context,
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    showLoadingDialog('保存中...');
    try {
      await ref
          .read(postControllerProvider.notifier)
          .addPost(bodyController.text, selectedImage.value);
      showToast('postしました');
      if (context.mounted) {
        context.pop();
      }
    } catch (e) {
      showToast('エラーが発生しました');
    } finally {
      hideLoadingDialog();
    }
    return;
  }

  Future<void> _editPost(
    GlobalKey<FormState> formKey,
    WidgetRef ref,
    TextEditingController bodyController,
    ValueNotifier<File?> selectedImage,
    BuildContext context,
    Post postData,
    String imageUrl,
    bool isDeleted,
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    showLoadingDialog('更新中...');

    try {
      await ref
          .read(postControllerProvider.notifier)
          .updatePost(
            postData,
            bodyController.text,
            selectedImage.value,
            imageUrl,
            isDeleted,
          );
      showToast('更新しました');
      if (context.mounted) {
        context.pop();
      }
    } catch (e) {
      showToast('エラーが発生しました');
    } finally {
      hideLoadingDialog();
    }
    return;
  }
}
