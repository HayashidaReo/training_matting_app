import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/component/breakable_text_form_field.dart';
import 'package:matching_app/feature/component/un_focus.dart';
import 'package:matching_app/feature/component/username_text_form_field.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';

class EditMyProfilePage extends HookConsumerWidget {
  const EditMyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController userNameController = useTextEditingController();
    final TextEditingController profileController = useTextEditingController();

    return UnFocus(
      child: Scaffold(
        appBar: AppBar(title: const Text('プロフィール編集')),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ref
              .watch(watchMyUserDataControllerProvider)
              .when(
                loading: () {
                  return const Center(child: CupertinoActivityIndicator());
                },
                error: (error, _) {
                  return Center(child: Text('エラーが発生しました'));
                },
                data: (myUserData) {
                  if (myUserData == null) {
                    return const Center(child: Text('ユーザーデータが取得できませんでした'));
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
                          HeightMarginSizedBox.small,
                          UsernameTextFormField(controller: userNameController),
                          HeightMarginSizedBox.large,
                          BreakableTextFormField(
                            controller: profileController,
                            label: '自己紹介',
                            maxLength: 133,
                          ),
                          HeightMarginSizedBox.normal,
                          CustomButton(
                            text: '変更する',
                            onPressed: () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              showLoadingDialog('変更中...');
                              ref
                                  .read(userControllerProvider.notifier)
                                  .updateUserProfile(
                                    myUserData,
                                    userNameController.text,
                                    profileController.text,
                                  );

                              hideLoadingDialog();
                              if (context.mounted) {
                                context.pop();
                              }
                              showToast('プロフィールを変更しました');
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}
