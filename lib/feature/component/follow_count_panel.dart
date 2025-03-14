import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/user/controller/follow_list_top_navigation_controller.dart';
import 'package:matching_app/function/format_follow_number.dart';

class FollowCountPanel extends ConsumerWidget {
  const FollowCountPanel({
    super.key,
    required this.followCount,
    required this.typeName,
    required this.tabIndex,
    required this.targetUserId,
    required this.isMyPage,
  });

  final int followCount;
  final String typeName;
  final int tabIndex;
  final String targetUserId;
  final bool isMyPage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isMyPage) {
      return InkWell(
        onTap: () {
          ref
              .read(followListTopNavigationControllerProvider.notifier)
              .updateIndex(tabIndex);
          context.pushNamed(
            AppRoute.followList.name,
            queryParameters: {'targetUserId': targetUserId},
          );
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              formatFollowNumber(followCount),
              style: TextStyle(fontSize: FontSize.normal),
            ),
            Text(typeName, style: TextStyle(fontSize: FontSize.smallNormal)),
          ],
        ),
      );
    } else {
      return ref
          .watch(
            WatchWhetherIFollowTargetUserControllerProvider(
              ref.read(currentUserControllerProvider)!.uid,
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
              return ref
                  .watch(
                    watchWhetherTargetUserFollowMeControllerProvider(
                      ref.read(currentUserControllerProvider)!.uid,
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
                    data: (bool isFollowed) {
                      return InkWell(
                        onTap:
                            (isFollowing && isFollowed)
                                ? () {
                                  ref
                                      .read(
                                        followListTopNavigationControllerProvider
                                            .notifier,
                                      )
                                      .updateIndex(tabIndex);
                                  context.pushNamed(
                                    AppRoute.followList.name,
                                    queryParameters: {
                                      'targetUserId': targetUserId,
                                    },
                                  );
                                }
                                : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              formatFollowNumber(followCount),
                              style: TextStyle(fontSize: FontSize.normal),
                            ),
                            Text(
                              typeName,
                              style: TextStyle(fontSize: FontSize.smallNormal),
                            ),
                          ],
                        ),
                      );
                    },
                  );
            },
          );
    }
  }
}
