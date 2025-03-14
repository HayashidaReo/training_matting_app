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
import 'package:matching_app/config/utils/margin/width_margin_sized_box.dart';
import 'package:matching_app/feature/auth/controller/auth_controller.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/badge_count_widget.dart';
import 'package:matching_app/feature/component/follow_count_panel.dart';
import 'package:matching_app/feature/component/hamburger_tile.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/component/recommend_follow_card.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/follow/model/follow.dart';
import 'package:matching_app/feature/navigation/controller/bottom_navigation_controller.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {
                  ref
                      .read(bottomNavigationControllerProvider.notifier)
                      .updateIndex(2);
                  context.goNamed(AppRoute.talkList.name);
                },
              ),
              Positioned(
                top: 4,
                right: 4,
                child: ref
                    .watch(watchAllNotOpenedTalkHistoryCountControllerProvider)
                    .when(
                      error: (error, stackTrace) {
                        return const Text('?');
                      },
                      loading: () {
                        return const CircularProgressIndicator();
                      },
                      data: (int count) {
                        if (count == 0) {
                          return const SizedBox.shrink();
                        }
                        return badgeCountWidget(ref, count);
                      },
                    ),
              ),
            ],
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
        child: ref
            .watch(watchMyUserDataControllerProvider)
            .when(
              data: (UserData? userData) {
                if (userData == null) {
                  return Text(
                    'ユーザー情報が取得できませんでした。',
                    style: TextStyle(fontSize: FontSize.large),
                  );
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconImage(
                            iconImageUrl: userData.iconImageUrl,
                            size: 100,
                            onTap: () {
                              context.pushNamed(AppRoute.editMyIcon.name);
                            },
                          ),
                          WidthMarginSizedBox.normal,
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    8,
                                    8,
                                    8,
                                    16,
                                  ),
                                  child: Text(
                                    userData.userName,
                                    style: TextStyle(
                                      fontSize: FontSize.medium,
                                      color:
                                          (userData.gender == '男性')
                                              ? defaultColors.femaleColor
                                              : defaultColors.maleColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ref
                                        .watch(
                                          watchAllMyFollowingUserListControllerProvider(
                                            ref
                                                .read(
                                                  currentUserControllerProvider,
                                                )!
                                                .uid,
                                          ),
                                        )
                                        .when(
                                          data: (
                                            List<Follow> followingUserList,
                                          ) {
                                            return FollowCountPanel(
                                              followCount:
                                                  followingUserList.length,
                                              typeName: 'フォロー',
                                              tabIndex: 0,
                                              targetUserId:
                                                  ref
                                                      .read(
                                                        currentUserControllerProvider,
                                                      )!
                                                      .uid,
                                              isMyPage: true,
                                            );
                                          },
                                          error: (error, _) {
                                            return FollowCountPanel(
                                              followCount: 0,
                                              typeName: 'フォロー',
                                              tabIndex: 0,
                                              targetUserId:
                                                  ref
                                                      .read(
                                                        currentUserControllerProvider,
                                                      )!
                                                      .uid,
                                              isMyPage: true,
                                            );
                                          },
                                          loading: () {
                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                    ref
                                        .watch(
                                          watchAllFollowMeUserListControllerProvider(
                                            ref
                                                .read(
                                                  currentUserControllerProvider,
                                                )!
                                                .uid,
                                          ),
                                        )
                                        .when(
                                          data: (
                                            List<Follow> followingUserList,
                                          ) {
                                            return FollowCountPanel(
                                              followCount:
                                                  followingUserList.length,
                                              typeName: 'フォロワー',
                                              tabIndex: 1,
                                              targetUserId:
                                                  ref
                                                      .read(
                                                        currentUserControllerProvider,
                                                      )!
                                                      .uid,
                                              isMyPage: true,
                                            );
                                          },
                                          error: (error, _) {
                                            return FollowCountPanel(
                                              followCount: 0,
                                              typeName: 'フォロワー',
                                              tabIndex: 1,
                                              targetUserId:
                                                  ref
                                                      .read(
                                                        currentUserControllerProvider,
                                                      )!
                                                      .uid,
                                              isMyPage: true,
                                            );
                                          },
                                          loading: () {
                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                    ref
                                        .watch(
                                          watchAllMutualFollowUserListControllerProvider(
                                            ref
                                                .read(
                                                  currentUserControllerProvider,
                                                )!
                                                .uid,
                                          ),
                                        )
                                        .when(
                                          data: (
                                            List<Follow> followingUserList,
                                          ) {
                                            return FollowCountPanel(
                                              followCount:
                                                  followingUserList.length,
                                              typeName: '相互フォロー',
                                              tabIndex: 2,
                                              targetUserId:
                                                  ref
                                                      .read(
                                                        currentUserControllerProvider,
                                                      )!
                                                      .uid,
                                              isMyPage: true,
                                            );
                                          },
                                          error: (error, _) {
                                            return FollowCountPanel(
                                              followCount: 0,
                                              typeName: '相互フォロー',
                                              tabIndex: 2,
                                              targetUserId:
                                                  ref
                                                      .read(
                                                        currentUserControllerProvider,
                                                      )!
                                                      .uid,
                                              isMyPage: true,
                                            );
                                          },
                                          loading: () {
                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '性別:',
                                style: TextStyle(fontSize: FontSize.normal),
                              ),
                              Text(
                                '生年月日:',
                                style: TextStyle(fontSize: FontSize.normal),
                              ),
                            ],
                          ),
                          WidthMarginSizedBox.normal,
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                userData.gender,
                                style: TextStyle(fontSize: FontSize.normal),
                              ),
                              Text(
                                userData.birthDate.toString(),
                                style: TextStyle(fontSize: FontSize.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    HeightMarginSizedBox.small,
                    if (userData.profile != '')
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userData.profile,
                          style: TextStyle(fontSize: FontSize.normal),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.pushNamed(AppRoute.editMyProfile.name);
                          },
                          child: Text(
                            'プロフィール情報を入力',
                            style: TextStyle(fontSize: FontSize.normal),
                          ),
                        ),
                      ],
                    ),
                    ref
                        .watch(
                          watchAllOnlyIncomingFollowUserListControllerProvider(
                            ref.read(currentUserControllerProvider)!.uid,
                          ),
                        )
                        .when(
                          data: (List<Follow> onlyIncomingFollowList) {
                            return Column(
                              children: [
                                HeightMarginSizedBox.small,
                                if (onlyIncomingFollowList.isNotEmpty)
                                  Text(
                                    '新たな出会いを見つけませんか？',
                                    style: TextStyle(fontSize: FontSize.normal),
                                  ),
                                HeightMarginSizedBox.small,
                                SizedBox(
                                  height: 210,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: onlyIncomingFollowList.length,
                                    itemBuilder: (context, index) {
                                      final Follow followData =
                                          onlyIncomingFollowList[index];
                                      return ref
                                          .watch(
                                            watchUserDataControllerProvider(
                                              followData.followingUserId,
                                            ),
                                          )
                                          .when(
                                            data: (UserData? userData) {
                                              if (userData == null) {
                                                return Text(
                                                  'ユーザー情報が取得できませんでした。',
                                                  style: TextStyle(
                                                    fontSize: FontSize.large,
                                                  ),
                                                );
                                              }
                                              return RecommendFollowCard(
                                                userData: userData,
                                              );
                                            },
                                            error: (error, _) {
                                              return Text(
                                                'エラーが発生しました。再度お試しください。',
                                                style: TextStyle(
                                                  fontSize: FontSize.large,
                                                ),
                                              );
                                            },
                                            loading: () {
                                              return const CircularProgressIndicator();
                                            },
                                          );
                                    },
                                  ),
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
