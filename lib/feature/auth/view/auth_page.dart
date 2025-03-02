import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                MarginSizedBox.smallHeightMargin,
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
                MarginSizedBox.smallHeightMargin,
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      context.push(AppRoute.passwordRemainder.toRoute);
                    },
                    child: Text(
                      'パスワードを忘れた方はこちら>',
                      style: TextStyle(color: defaultColors.blueTextColor),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                MarginSizedBox.largeHeightMargin,
                Icon(
                  Icons.remove,
                  size: 40,
                  color: defaultColors.blueTextColor,
                ),
                MarginSizedBox.smallHeightMargin,
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: DefaultButton(
                    buttonText: '会員登録',
                    onDefaultButtonPressed: () async {
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

                MarginSizedBox.smallHeightMargin,
                DefaultButton(
                  buttonText: 'ログイン',
                  onDefaultButtonPressed: () async {
                    await _signIn(
                      formKey,
                      ref,
                      emailController,
                      passwordController,
                      context,
                    );
                  },
                  backgroundColor: defaultColors.whiteBackgroundColor,
                  textColor: defaultColors.blueTextColor,
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
  await ref.read(userRepoProvider.notifier).createUser(accountData);
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
