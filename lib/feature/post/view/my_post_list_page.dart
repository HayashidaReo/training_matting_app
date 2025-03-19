import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/post_tile.dart';
import 'package:matching_app/feature/post/controller/post_controller.dart';
import 'package:matching_app/feature/post/model/post.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class MyPostListPage extends HookConsumerWidget {
  const MyPostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(myAllPostsLimitControllerProvider.notifier).incrementLimit();
      }
    });
    return Scaffold(
      body: ref
          .watch(watchMyAllPostsControllerProvider)
          .when(
            skipLoadingOnReload: true,
            error: (error, _) {
              return const Center(child: Text('エラーが発生しました'));
            },
            loading: () {
              return const Center(child: CupertinoActivityIndicator());
            },
            data: (List<Post> postListData) {
              return SingleChildScrollView(
                controller: scrollController,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  shrinkWrap: true,
                  cacheExtent:
                      1000.0 *
                      postListData.length, // 下までスクロールした後に上にスクロールすると、がくつく問題を解消
                  itemCount: postListData.length,

                  itemBuilder: (context, index) {
                    final Post postData = postListData[index];
                    final String uid =
                        ref.read(currentUserControllerProvider)!.uid;
                    final bool isMe = (uid == postData.userId);
                    return ref
                        .watch(watchUserDataControllerProvider(postData.userId))
                        .when(
                          error: (error, _) {
                            return Center(child: Text('エラーが発生しました'));
                          },
                          loading: () {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          },
                          data: (UserData? postUserData) {
                            return PostTile(
                              postData: postData,
                              postUser: postUserData!,
                              isMe: isMe,
                            );
                          },
                        );
                  },
                ),
              );
            },
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: defaultColors.accentButtonBackColor,
        foregroundColor: defaultColors.accentButtonTextColor,
        tooltip: '新しい投稿',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        onPressed: () {
          context.pushNamed(AppRoute.addPost.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
