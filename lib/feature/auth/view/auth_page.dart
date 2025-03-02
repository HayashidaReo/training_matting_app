import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/close_only_dialog.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:matching_app/feature/component/email_text_form_field.dart';
import 'package:matching_app/feature/component/password_text_form_field.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final passwordVisible = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GonTwitter', style: TextStyle(fontSize: 32)),
        toolbarHeight: 100,
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
                HeightMarginSizedBox.normal,
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      // context.push(AppRoute.passwordRemainder.toRoute);
                    },
                    child: Text(
                      'パスワードを忘れた方はこちら>',
                      style: TextStyle(color: defaultColors.mainTextColor),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
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

                HeightMarginSizedBox.normal,
                CustomButton(
                  text: 'ログイン',
                  onPressed: () async {
                    await _signIn(
                      formKey,
                      ref,
                      emailController,
                      passwordController,
                      context,
                    );
                  },
                  isColorReversed: true,
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
      .read(authRepoProvider.notifier)
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
  UserData accountData = UserData(
    userId: ref.read(authRepoProvider)!.uid,
    userName: '',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
    imageUrl: '',
    profile: '',
  );
  // TODO: 作成処理作る
  // await ref.read(userRepoProvider.notifier).createUser(accountData);
  hideLoadingDialog();
  return;
}

Future<void> _signIn(
  GlobalKey<FormState> formKey,
  WidgetRef ref,
  TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context,
) async {
  if (!formKey.currentState!.validate()) {
    return;
  }
  // ログイン処理
  showLoadingDialog('ログイン中...');
  final String signinUserResult = await ref
      .read(authRepoProvider.notifier)
      .signIn(email: emailController.text, password: passwordController.text);
  if (signinUserResult != 'success') {
    hideLoadingDialog();
    if (context.mounted) {
      showCloseOnlyDialog(context, 'エラー', signinUserResult);
    }
    return;
  }
  hideLoadingDialog();
  return;
}
