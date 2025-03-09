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
import 'package:matching_app/feature/component/single_line_text_form_field.dart';
import 'package:matching_app/feature/component/email_text_form_field.dart';
import 'package:matching_app/feature/component/password_text_form_field.dart';
import 'package:matching_app/feature/component/username_text_form_field.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/function/timestamp_converter.dart';

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
    final TextEditingController usernameController = useTextEditingController();
    final selectedGenderList = useState<List<bool>>([true, false]);
    final TextEditingController birthDateController =
        useTextEditingController();

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
                HeightMarginSizedBox.normal,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: defaultColors.textFiledBorderColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ), // 文字の左右に余白をつける
                      child: Text(
                        'ユーザー情報',
                        style: TextStyle(
                          fontSize: FontSize.normal,
                          color: defaultColors.mainTextColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: defaultColors.textFiledBorderColor,
                      ),
                    ),
                  ],
                ),
                HeightMarginSizedBox.small,
                UsernameTextFormField(controller: usernameController),
                HeightMarginSizedBox.small,
                // TODO: これらを保存する処理を追加
                // TODO: これらのdata_modelを追加
                ToggleButtons(
                  isSelected: selectedGenderList.value,
                  onPressed: (int index) {
                    selectedGenderList.value = List.generate(
                      selectedGenderList.value.length,
                      (i) => i == index,
                    );
                  },
                  borderRadius: BorderRadius.circular(8), // 角丸デザイン
                  selectedColor:
                      defaultColors.mainButtonTextWhiteColor, // 選択時のテキストカラー
                  fillColor: defaultColors.mainButtonBackPinkColor, // 選択時の背景色
                  color: defaultColors.subButtonTextPinkColor, // 未選択時のテキストカラー
                  selectedBorderColor:
                      defaultColors.buttonBorderPinkColor, // 選択時のボーダー
                  borderWidth: 2,
                  constraints: BoxConstraints(
                    minWidth: 120, // 各ボタンの最小幅
                    minHeight: 50, // 各ボタンの最小高さ
                  ),
                  children: [
                    Text('男性', style: TextStyle(fontSize: FontSize.normal)),
                    Text('女性', style: TextStyle(fontSize: FontSize.normal)),
                  ],
                ),

                HeightMarginSizedBox.normal,
                GestureDetector(
                  behavior: HitTestBehavior.opaque, // 透明な部分でもタップを検出
                  onTap: () {
                    showDatePicker(
                      context: context,
                      locale: const Locale('ja'),
                      initialDate: DateTime(
                        DateTime.now().year - 20,
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(
                        DateTime.now().year - 20,
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                    ).then((value) {
                      if (value != null) {
                        birthDateController.text = fromDateToString(value);
                      }
                    });
                  },
                  child: AbsorbPointer(
                    // TextFormFieldのタップを無効化
                    child: SingleLineTextFormField(
                      controller: birthDateController,
                      label: '生年月日',
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
                        formKey: formKey,
                        ref: ref,
                        emailController: emailController,
                        passwordController: passwordController,
                        usernameController: usernameController,
                        genderList: selectedGenderList.value,
                        birthDateController: birthDateController,
                        context: context,
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

Future<void> _createUser({
  required GlobalKey<FormState> formKey,
  required WidgetRef ref,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required BuildContext context,
  required TextEditingController usernameController,
  required List<bool> genderList,
  required TextEditingController birthDateController,
}) async {
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
  await ref
      .read(userControllerProvider.notifier)
      .createUser(
        username: usernameController.text,
        birthDate: birthDateController.text,
        genderList: genderList,
      );
  hideLoadingDialog();
  if (context.mounted) {
    context.goNamed(AppRoute.tweetList.name);
  }
  return;
}
