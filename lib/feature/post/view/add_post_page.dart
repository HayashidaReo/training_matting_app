import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/component/breakable_text_form_field.dart';
import 'package:matching_app/feature/component/un_focus.dart';
import 'package:matching_app/feature/post/controller/post_controller.dart';
import 'package:matching_app/function/get_image_from_gallery.dart';

class AddPostPage extends HookConsumerWidget {
  const AddPostPage({super.key, this.postId});

  final String? postId;
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
}
