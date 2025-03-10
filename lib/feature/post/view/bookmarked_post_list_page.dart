import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/bookmark/controller/bookmark_controller.dart';
import 'package:matching_app/feature/bookmark/model/bookmark.dart';
import 'package:matching_app/feature/component/post_tile.dart';
import 'package:matching_app/feature/post/controller/post_controller.dart';
import 'package:matching_app/feature/post/data_model/post.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';

class BookmarkedPostListPage extends ConsumerWidget {
  const BookmarkedPostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(watchMyAllBookmarksControllerProvider)
        .when(
          error: (error, _) {
            return const Center(child: Text('エラーが発生しました'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          data: (List<Bookmark> bookmarkList) {
            return Scaffold(
              body: SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  cacheExtent:
                      1000.0 *
                      bookmarkList.length, // 下までスクロールした後に上にスクロールすると、がくつく問題を解消
                  itemCount: bookmarkList.length,

                  itemBuilder: (context, index) {
                    return ref
                        .watch(
                          watchPostControllerProvider(
                            bookmarkList[index].postId,
                          ),
                        )
                        .when(
                          error: (error, _) {
                            return const Center(child: Text('エラーが発生しました'));
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          data: (Post? postData) {
                            if (postData == null) {
                              return const Center(child: Text('データが存在しません'));
                            }
                            final String uid =
                                ref.read(currentUserControllerProvider)!.uid;
                            final bool isMe = (uid == postData.userId);
                            return ref
                                .watch(
                                  watchUserDataControllerProvider(
                                    postData.userId,
                                  ),
                                )
                                .when(
                                  error: (error, _) {
                                    return Center(child: Text('エラー: $error'));
                                  },
                                  loading: () {
                                    return const Center(
                                      child: CircularProgressIndicator(),
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
                        );
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: defaultColors.mainButtonBackPinkColor,
                foregroundColor: defaultColors.mainButtonTextWhiteColor,
                onPressed: () {
                  context.pushNamed(AppRoute.addPost.name);
                },
                child: const Icon(Icons.add),
              ),
            );
          },
        );
  }
}
