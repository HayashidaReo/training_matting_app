import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:matching_app/feature/component/email_text_form_field.dart';

class PasswordRemainderPage extends HookConsumerWidget {
  const PasswordRemainderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('パスワード再設定画面')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeightMarginSizedBox.large,
                EmailTextFormField(controller: emailController, label: 'Email'),
                HeightMarginSizedBox.large,
                CustomButton(
                  text: 'パスワード再設定メールを送信する',
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    showLoadingDialog('送信中...');
                    ref
                        .read(authRepoProvider.notifier)
                        .sendPasswordResetEmail(emailController.text);
                    hideLoadingDialog();
                    showToast('パスワード再設定メールを送信しました');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
