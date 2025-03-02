import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_test/common_widget/default_button.dart';
import 'package:twitter_test/config/utils/margin_sized_box.dart';
import 'package:twitter_test/functions/global_functions.dart';
import 'package:twitter_test/repo/auth/auth_repo.dart';
import 'package:twitter_test/views/components/email_text_form_field.dart';

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
                MarginSizedBox.mediumHeightMargin,
                EmailTextFormField(controller: emailController, label: 'Email'),
                MarginSizedBox.largeHeightMargin,
                DefaultButton(
                  buttonText: 'パスワード再設定メールを送信する',
                  onDefaultButtonPressed: () async {
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
