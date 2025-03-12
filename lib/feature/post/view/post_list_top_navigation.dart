import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/post/controller/post_list_top_navigation_controller.dart';
import 'package:matching_app/feature/post/view/all_post_list_page.dart';
import 'package:matching_app/feature/post/view/bookmarked_post_list_page.dart';
import 'package:matching_app/feature/post/view/my_post_list_page.dart';

class PostListTopNavigationPage extends ConsumerWidget {
  const PostListTopNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      initialIndex: ref.watch(postListTopNavigationControllerProvider),
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColors.navigationBackColor,
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            Container(
              color: defaultColors.navigationBackColor,
              height: 50,
              child: TabBar(
                indicatorColor: defaultColors.primaryColor,
                labelColor: defaultColors.navigationSelectedTextColor,
                unselectedLabelColor:
                    defaultColors.navigationUnSelectedTextColor,
                onTap: (index) {
                  ref
                      .read(postListTopNavigationControllerProvider.notifier)
                      .updateIndex(index);
                },
                tabs: [
                  SizedBox(
                    height: 24,
                    child: Center(
                      child: Text(
                        'ポスト一覧',
                        style: TextStyle(fontSize: FontSize.small),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    child: Center(
                      child: Text(
                        'ブックマーク',
                        style: TextStyle(fontSize: FontSize.small),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    child: Center(
                      child: Text(
                        '自分のポスト',
                        style: TextStyle(fontSize: FontSize.small),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllPostListPage(),
                  BookmarkedPostListPage(),
                  MyPostListPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
