import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/close_only_dialog.dart';
import 'package:matching_app/common_widget/confirm_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/auth/controller/auth_controller.dart';
import 'package:matching_app/feature/component/hamburger_tile.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _signOut(context, ref);
            },
          ),
        ],
      ),
      drawer: Container(
        color: defaultColors.hamburgerMenuBackColor,
        height: double.infinity,
        width: 250,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            HeightMarginSizedBox.normal,
            HamburgerTile(
              buttonTitle: 'メールアドレス変更',
              onPressed: () async {
                context.pushNamed(AppRoute.editEmail.name);
              },
            ),
            HamburgerTile(
              buttonTitle: 'パスワード変更',
              onPressed: () {
                _resetPassword(context, ref);
              },
            ),
            HamburgerTile(
              buttonTitle: 'アイコン編集',
              onPressed: () {
                context.pushNamed(AppRoute.editMyIcon.name);
              },
            ),
            HamburgerTile(
              buttonTitle: 'プロフィール編集',
              onPressed: () {
                context.pushNamed(AppRoute.editMyProfile.name);
              },
            ),
            HamburgerTile(
              buttonTitle: 'ログアウト',
              onPressed: () async {
                _signOut(context, ref);
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ref
                  .watch(watchMyUserDataControllerProvider)
                  .when(
                    data: (UserData? data) {
                      if (data == null) {
                        return Text(
                          'ユーザー情報が取得できませんでした。',
                          style: TextStyle(fontSize: FontSize.large),
                        );
                      }

                      return Column(
                        children: [
                          if (data.iconImageUrl == '')
                            InkWell(
                              onTap: () {
                                context.pushNamed(AppRoute.editMyIcon.name);
                              },
                              child: const Icon(
                                Icons.account_circle,
                                size: 100,
                              ),
                            )
                          else
                            InkWell(
                              onTap: () {
                                context.pushNamed(AppRoute.editMyIcon.name);
                              },
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: data.iconImageUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: (
                                    context,
                                    url,
                                    downloadProgress,
                                  ) {
                                    return SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.image_not_supported_rounded,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          Text(
                            data.userName,
                            style: TextStyle(fontSize: FontSize.large),
                          ),
                        ],
                      );
                    },
                    error: (error, _) {
                      return Text(
                        'エラーが発生しました。再度お試しください。',
                        style: TextStyle(fontSize: FontSize.large),
                      );
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword(BuildContext context, WidgetRef ref) {
    showConfirmDialog(
      context: context,
      text: 'パスワード再設定メールを送信しますか？',
      onPressed: () async {
        final String result =
            await ref
                .read(authControllerProvider.notifier)
                .sendPasswordResetEmail();
        showToast('パスワード再設定メールを送信しました');
        if (result == 'success') {
          if (context.mounted) {
            context.pop();
          }
        } else {
          if (context.mounted) {
            showCloseOnlyDialog(context, result, 'エラー');
          }
        }
      },
    );
    return;
  }

  void _signOut(BuildContext context, WidgetRef ref) {
    showConfirmDialog(
      context: context,
      text: 'ログアウトしますか？',
      onPressed: () async {
        await ref.read(authControllerProvider.notifier).signOut();
        showToast('ログアウトしました');
      },
    );
    return;
  }
}
