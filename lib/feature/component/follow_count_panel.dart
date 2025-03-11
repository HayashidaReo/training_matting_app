import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/user/controller/follow_list_top_navigation_controller.dart';

class FollowCountPanel extends ConsumerWidget {
  const FollowCountPanel({
    super.key,
    required this.followCount,
    required this.typeName,
    required this.tabIndex,
    required this.targetUserId,
  });

  final int followCount;
  final String typeName;
  final int tabIndex;
  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            followCount.toString(),
            style: TextStyle(fontSize: FontSize.normal),
          ),
          Text(typeName, style: TextStyle(fontSize: FontSize.small)),
        ],
      ),
    );
  }
}
