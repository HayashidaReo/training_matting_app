import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/confirm_dialog.dart';
import 'package:matching_app/common_widget/custom_button.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/config/utils/margin/width_margin_sized_box.dart';
import 'package:matching_app/feature/component/follow_count_panel.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';
import 'package:matching_app/feature/user/view/my_page.dart';

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
                          if (userData.iconImageUrl == '')
                            InkWell(
                              onTap: () {
                                context.pushNamed(AppRoute.editMyIcon.name);
                              },
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/default_user_icon.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          else
                            InkWell(
                              onTap: () {
                                context.pushNamed(AppRoute.editMyIcon.name);
                              },
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: userData.iconImageUrl,
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
                                    return ClipOval(
                                      child: Image.asset(
                                        'assets/images/default_user_icon.png',
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    );
                                  },
                                ),
                              ),
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
                                    style: TextStyle(fontSize: FontSize.normal),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FollowCountPanel(
                                      followCount: 10,
                                      typeName: 'フォロー',
                                    ),
                                    FollowCountPanel(
                                      followCount: 10,
                                      typeName: 'フォロワー',
                                    ),
                                    FollowCountPanel(
                                      followCount: 10,
                                      typeName: '相互フォロー',
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
                                style: TextStyle(fontSize: FontSize.small),
                              ),
                              Text(
                                '生年月日:',
                                style: TextStyle(fontSize: FontSize.small),
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
                                style: TextStyle(fontSize: FontSize.small),
                              ),
                              Text(
                                userData.birthDate.toString(),
                                style: TextStyle(fontSize: FontSize.small),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    HeightMarginSizedBox.small,
                    ref
                        .watch(
                          WatchWhetherIFollowTargetUserControllerProvider(
                            targetUserId,
                          ),
                        )
                        .when(
                          error: (error, _) {
                            return Text(
                              'エラーが発生しました。再度お試しください。',
                              style: TextStyle(fontSize: FontSize.large),
                            );
                          },
                          loading: () {
                            return const CircularProgressIndicator();
                          },
                          data: (bool isFollowing) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: CustomButton(
                                    text: isFollowing ? 'フォロー中' : 'フォローする',
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
                                SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: CustomButton(
                                    text: 'メッセージ',
                                    onPressed: () {
                                      // TODO: メッセージ機能の実装
                                    },
                                  ),
                                ),
                              ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.pushNamed(AppRoute.editMyProfile.name);
                          },
                          child: const Text('プロフィール情報を入力'),
                        ),
                      ],
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
  ) {
    if (isFollowing) {
      showConfirmDialog(
        context: context,
        text: 'フォローを解除しますか？',
        onPressed: () {
          Navigator.of(context).pop();
          ref
              .read(followControllerProvider.notifier)
              .deleteFollow(targetUserId);
        },
      );
    } else {
      ref.read(followControllerProvider.notifier).createFollow(targetUserId);
    }
    return;
  }
}
