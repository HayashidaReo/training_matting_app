import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/feature/component/user_list_tile.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/follow/model/follow.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';

class FollowListPage extends ConsumerWidget {
  const FollowListPage({super.key, required this.targetUserId});

  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ref
            .watch(watchAllMyFollowingUserListControllerProvider(targetUserId))
            .when(
              error: (error, _) {
                return const Center(child: Text('エラーが発生しました'));
              },
              loading: () {
                return const Center(child: CupertinoActivityIndicator());
              },
              data: (List<Follow> followingListData) {
                return ListView.separated(
                  itemCount: followingListData.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    final Follow followData = followingListData[index];
                    return ref
                        .watch(
                          watchUserDataControllerProvider(
                            followData.followerUserId,
                          ),
                        )
                        .when(
                          error: (error, _) {
                            return const Center(child: Text('エラーが発生しました'));
                          },
                          loading: () {
                            return const SizedBox();
                          },
                          data: (userData) {
                            if (userData == null) {
                              return const Center(child: Text('エラーが発生しました'));
                            }
                            return UserListTile(userData: userData);
                          },
                        );
                  },
                );
              },
            ),
      ),
    );
  }
}
