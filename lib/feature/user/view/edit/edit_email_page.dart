import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/common_widget/close_only_dialog.dart';
import 'package:matching_app/common_widget/confirm_dialog.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/auth/controller/auth_controller.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/email_text_form_field.dart';
import 'package:matching_app/feature/component/password_text_form_field.dart';

class EditEmailPage extends HookConsumerWidget {
  const EditEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController oldEmailController = useTextEditingController(
      text: ref.read(currentUserControllerProvider)?.email ?? '',
    );
    final TextEditingController newEmailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final passwordVisible = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(title: const Text('メールアドレス変更')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeightMarginSizedBox.large,
                EmailTextFormField(
                  controller: oldEmailController,
                  label: '現在のEmail',
                  readOnly: true,
                ),

                HeightMarginSizedBox.large,
                EmailTextFormField(
                  controller: newEmailController,
                  label: '新しいEmail',
                ),
                HeightMarginSizedBox.small,
                PasswordTextFormField(
                  controller: passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      passwordVisible.value = !passwordVisible.value;
                    },
                  ),
                  visible: !passwordVisible.value,
                ),

                HeightMarginSizedBox.large,
                CustomButton(
                  text: 'メールアドレス変更',
                  onPressed: () async {
                    _updateEmail(
                      formKey,
                      context,
                      ref,
                      newEmailController,
                      passwordController,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateEmail(
    GlobalKey<FormState> formKey,
    BuildContext context,
    WidgetRef ref,
    TextEditingController newEmailController,
    TextEditingController passwordController,
  ) {
    if (!formKey.currentState!.validate()) return;
    showConfirmDialog(
      context: context,
      text: '変更するために、一度ログアウトしますがよろしいですか？\nログアウト後、新しいメールアドレス宛に確認メールが送信されます。',
      onPressed: () async {
        context.pop();
        showLoadingDialog('送信中...');
        final result = await ref
            .read(authControllerProvider.notifier)
            .updateEmail(
              newEmail: newEmailController.text,
              password: passwordController.text,
            );
        hideLoadingDialog();
        if (result == 'success') {
          showToast('メールを送信しました');
        } else {
          if (context.mounted) {
            showCloseOnlyDialog(context, 'エラー', result);
          }
        }
      },
    );
    return;
  }
}
