import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/close_only_dialog.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/auth/controller/auth_controller.dart';
import 'package:matching_app/feature/component/email_text_form_field.dart';
import 'package:matching_app/feature/component/password_text_form_field.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';

class CreateUserPage extends HookConsumerWidget {
  const CreateUserPage({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final passwordVisible = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録画面', style: TextStyle(fontSize: FontSize.extraLarge)),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                EmailTextFormField(controller: emailController, label: 'Email'),
                HeightMarginSizedBox.normal,
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
                // TODO: 名前の入力欄を追加
                // TODO: 性別の選択欄を追加
                // TODO: 生年月日の選択欄を追加

                // TODO: これらを保存する処理を追加
                // TODO: これらのdata_modelを追加
                HeightMarginSizedBox.normal,
                Icon(
                  Icons.remove,
                  size: 40,
                  color: defaultColors.mainTextColor,
                ),
                HeightMarginSizedBox.normal,
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: CustomButton(
                    text: '会員登録',
                    onPressed: () async {
                      await _createUser(
                        formKey,
                        ref,
                        emailController,
                        passwordController,
                        context,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _createUser(
  GlobalKey<FormState> formKey,
  WidgetRef ref,
  TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context,
) async {
  if (!formKey.currentState!.validate()) {
    return;
  }
  showLoadingDialog('会員登録中...');
  // 新規登録処理
  final String createUserResult = await ref
      .read(authControllerProvider.notifier)
      .createUser(
        email: emailController.text,
        password: passwordController.text,
      );
  if (createUserResult != 'success') {
    hideLoadingDialog();
    if (context.mounted) {
      showCloseOnlyDialog(context, 'エラー', createUserResult);
    }
    return;
  }
  await ref.read(userControllerProvider.notifier).createUser();
  hideLoadingDialog();
  if (context.mounted) {
    context.goNamed(AppRoute.tweetList.name);
  }
  return;
}
