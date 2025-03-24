import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/navigation/controller/bottom_navigation_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class UserListTile extends ConsumerWidget {
  const UserListTile({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: IconImage(iconImageUrl: userData.iconImageUrl, size: 60),
      title: Text(
        userData.userName,
        style: TextStyle(
          fontSize: FontSize.normal,
          color:
              (userData.gender == 0)
                  ? defaultColors.femaleColor
                  : defaultColors.maleColor,
        ),
      ),
      subtitle: ref
          .watch(
            watchWhetherTargetUserFollowMeControllerProvider(
              ref.read(currentUserControllerProvider)!.uid,
              userData.userId,
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
              return const CupertinoActivityIndicator();
            },
            data: (bool isFollowed) {
              if (isFollowed) {
                return Text(
                  'フォローされています',
                  style: TextStyle(
                    fontSize: FontSize.smallNormal,
                    color: defaultColors.userListFollowedStateTextColor,
                  ),
                );
              } else {
                return null;
              }
            },
          ),
      onTap: () async {
        if (userData.userId == ref.read(currentUserControllerProvider)!.uid) {
          ref.read(bottomNavigationControllerProvider.notifier).updateIndex(3);
          context.pushNamed(AppRoute.myPage.name);
        } else {
          context.pushNamed(
            AppRoute.otherUserProfile.name,
            queryParameters: {'userId': userData.userId},
          );
        }
      },
    );
  }
}
