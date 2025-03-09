import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/user/controller/follow_list_top_navigation_controller.dart';
import 'package:matching_app/feature/user/view/follow_list_page.dart';

class FollowListTopNavigationPage extends ConsumerWidget {
  const FollowListTopNavigationPage({super.key});

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
                onTap: (index) {
                  ref
                      .read(followListTopNavigationControllerProvider.notifier)
                      .updateIndex(index);
                },
                tabs: [
                  Text('フォロー', style: TextStyle(fontSize: FontSize.small)),
                  Text('フォロワー', style: TextStyle(fontSize: FontSize.small)),
                  Text('相互フォロー', style: TextStyle(fontSize: FontSize.small)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FollowListPage(),
                  FollowListPage(),
                  FollowListPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
