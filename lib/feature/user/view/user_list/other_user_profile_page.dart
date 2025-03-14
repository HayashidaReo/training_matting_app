import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/close_only_dialog.dart';
import 'package:matching_app/common_widget/confirm_dialog.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/config/utils/margin/width_margin_sized_box.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/follow_count_panel.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/follow/model/follow.dart';
import 'package:matching_app/feature/talk/controller/talk_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class OtherUserProfilePage extends ConsumerWidget {
  const OtherUserProfilePage({super.key, required this.targetUserId});

  final String targetUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ref
            .watch(watchUserDataControllerProvider(targetUserId))
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
                            size: 95,
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
                                      fontSize: FontSize.normal,
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
                                            targetUserId,
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
                                              targetUserId: targetUserId,
                                              isMyPage: false,
                                            );
                                          },
                                          error: (error, _) {
                                            return FollowCountPanel(
                                              followCount: 0,
                                              typeName: 'フォロー',
                                              tabIndex: 0,
                                              targetUserId: targetUserId,
                                              isMyPage: false,
                                            );
                                          },
                                          loading: () {
                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                    ref
                                        .watch(
                                          watchAllFollowMeUserListControllerProvider(
                                            targetUserId,
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
                                              targetUserId: targetUserId,
                                              isMyPage: false,
                                            );
                                          },
                                          error: (error, _) {
                                            return FollowCountPanel(
                                              followCount: 0,
                                              typeName: 'フォロワー',
                                              tabIndex: 1,
                                              targetUserId: targetUserId,
                                              isMyPage: false,
                                            );
                                          },
                                          loading: () {
                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                    ref
                                        .watch(
                                          watchAllMutualFollowUserListControllerProvider(
                                            targetUserId,
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
                                              targetUserId: targetUserId,
                                              isMyPage: false,
                                            );
                                          },
                                          error: (error, _) {
                                            return FollowCountPanel(
                                              followCount: 0,
                                              typeName: '相互フォロー',
                                              tabIndex: 2,
                                              targetUserId: targetUserId,
                                              isMyPage: false,
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
                    if (userData.userId !=
                        ref.read(currentUserControllerProvider)!.uid)
                      ref
                          .watch(watchMyUserDataControllerProvider)
                          .when(
                            error: (error, _) {
                              return Text('エラーが発生しました');
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                            data: (UserData? myUserData) {
                              if (myUserData == null) {
                                return Text('エラーが発生しました');
                              }
                              if (myUserData.gender == userData.gender) {
                                return const SizedBox.shrink();
                              }
                              return ref
                                  .watch(
                                    WatchWhetherIFollowTargetUserControllerProvider(
                                      ref
                                          .read(currentUserControllerProvider)!
                                          .uid,
                                      targetUserId,
                                    ),
                                  )
                                  .when(
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
                                    data: (bool isFollowing) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            height: 40,
                                            child: CustomButton(
                                              text:
                                                  isFollowing
                                                      ? 'フォロー中'
                                                      : 'フォローする',
                                              onPressed: () {
                                                _changeFollowStatus(
                                                  context,
                                                  isFollowing,
                                                  ref,
                                                );
                                              },
                                              isColorReversed: isFollowing,
                                            ),
                                          ),
                                          ref
                                              .watch(
                                                watchWhetherTargetUserFollowMeControllerProvider(
                                                  ref
                                                      .read(
                                                        currentUserControllerProvider,
                                                      )!
                                                      .uid,
                                                  targetUserId,
                                                ),
                                              )
                                              .when(
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
                                                data: (bool isFollowed) {
                                                  return SizedBox(
                                                    width: 150,
                                                    height: 40,
                                                    child: CustomButton(
                                                      text: 'メッセージ',

                                                      onPressed: () {
                                                        if (isFollowing &&
                                                            isFollowed) {
                                                          context.pushNamed(
                                                            AppRoute
                                                                .talkRoom
                                                                .name,
                                                            queryParameters: {
                                                              'targetUserId':
                                                                  targetUserId,
                                                            },
                                                          );
                                                          return;
                                                        } else {
                                                          showCloseOnlyDialog(
                                                            context,
                                                            '使用できません',
                                                            'メッセージ機能は相互フォローの場合のみ使用できます。',
                                                          );
                                                        }
                                                      },
                                                      isColorReversed:
                                                          !(isFollowing &&
                                                              isFollowed),
                                                    ),
                                                  );
                                                },
                                              ),
                                        ],
                                      );
                                    },
                                  );
                            },
                          ),

                    HeightMarginSizedBox.normal,
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

  void _changeFollowStatus(
    BuildContext context,
    bool isFollowing,
    WidgetRef ref,
  ) async {
    if (isFollowing) {
      showConfirmDialog(
        context: context,
        text: 'フォローを解除しますか？\n解除するとメッセージ機能が使用できなくなり、履歴も削除されます。',
        onPressed: () async {
          Navigator.of(context).pop();
          ref
              .read(followControllerProvider.notifier)
              .deleteFollow(targetUserId);

          final bool isFollowedNow = await ref
              .read(followControllerProvider.notifier)
              .getWhetherTargetUserFollowMe(
                ref.read(currentUserControllerProvider)!.uid,
                targetUserId,
              );
          if (isFollowedNow) {
            // 相互フォローが終わった時
            ref
                .read(talkControllerProvider.notifier)
                .deleteTalkRoom(
                  ref.read(currentUserControllerProvider)!.uid,
                  targetUserId,
                );
          }
        },
      );
    } else {
      ref.read(followControllerProvider.notifier).createFollow(targetUserId);
      final bool isMutualFollowNow = await ref
          .read(followControllerProvider.notifier)
          .getWhetherTargetUserFollowMe(
            ref.read(currentUserControllerProvider)!.uid,
            targetUserId,
          );
      if (isMutualFollowNow) {
        // 相互フォローになったとき
        ref
            .read(talkControllerProvider.notifier)
            .createTalkRoom(
              ref.read(currentUserControllerProvider)!.uid,
              targetUserId,
            );
        if (context.mounted) {
          showCloseOnlyDialog(
            context,
            '🎊マッチング成立🎊',
            'おめでとうございます！\nマッチングしました！早速メッセージを送りましょう！',
          );
        }
      }

      return;
    }
  }
}
