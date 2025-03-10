import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/post/controller/post_list_top_navigation_controller.dart';
import 'package:matching_app/feature/post/view/all_post_list_page.dart';
import 'package:matching_app/feature/post/view/bookmarked_post_list_page.dart';
import 'package:matching_app/feature/user/view/follow_list_page.dart';

class PostListTopNavigationPage extends ConsumerWidget {
  const PostListTopNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      initialIndex: ref.watch(postListTopNavigationControllerProvider),
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('ポスト')),
        body: Column(
          children: [
            SizedBox(
              height: 30,
              child: TabBar(
                onTap: (index) {
                  ref
                      .read(postListTopNavigationControllerProvider.notifier)
                      .updateIndex(index);
                },
                tabs: [
                  Text('ポスト一覧', style: TextStyle(fontSize: FontSize.small)),
                  Text('ブックマーク', style: TextStyle(fontSize: FontSize.small)),
                  Text('自分のポスト', style: TextStyle(fontSize: FontSize.small)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllPostListPage(),
                  BookmarkedPostListPage(),
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
