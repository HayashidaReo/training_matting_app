import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/user/controller/follow_list_top_navigation_controller.dart';
import 'package:matching_app/feature/follow/view/follow_list_page.dart';
import 'package:matching_app/feature/follow/view/follower_list_page.dart';
import 'package:matching_app/feature/follow/view/mutual_follow_list_page.dart';

class FollowListTopNavigationPage extends ConsumerWidget {
  const FollowListTopNavigationPage({super.key, required this.targetUserId});

  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      initialIndex: ref.watch(followListTopNavigationControllerProvider),
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('フォロー一覧')),
        body: Column(
          children: [
            SizedBox(
              height: 30,
              child: TabBar(
                indicatorColor: defaultColors.primaryColor,
                labelColor: defaultColors.navigationSelectedTextColor,
                unselectedLabelColor:
                    defaultColors.navigationUnSelectedTextColor,
                onTap: (index) {
                  ref
                      .read(followListTopNavigationControllerProvider.notifier)
                      .updateIndex(index);
                },
                tabs: [
                  Text(
                    'フォロワー',
                    style: TextStyle(fontSize: FontSize.smallNormal),
                  ),
                  Text(
                    'フォロー',
                    style: TextStyle(fontSize: FontSize.smallNormal),
                  ),
                  Text(
                    '相互フォロー',
                    style: TextStyle(fontSize: FontSize.smallNormal),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FollowerListPage(targetUserId: targetUserId),
                  FollowListPage(targetUserId: targetUserId),
                  MutualFollowListPage(targetUserId: targetUserId),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
