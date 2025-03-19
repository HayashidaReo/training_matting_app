import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/feature/component/user_list_tile.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/follow/model/follow.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';

class MutualFollowListPage extends HookConsumerWidget {
  const MutualFollowListPage({super.key, required this.targetUserId});

  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref
            .read(allMutualFollowUserLimitControllerProvider.notifier)
            .incrementLimit();
      }
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ref
            .watch(watchAllMutualFollowUserListControllerProvider(targetUserId))
            .when(
              skipLoadingOnReload: true,
              error: (error, _) {
                return const Center(child: Text('エラーが発生しました'));
              },
              loading: () {
                return const Center(child: CupertinoActivityIndicator());
              },
              data: (List<Follow> followingListData) {
                return ListView.separated(
                  controller: scrollController,
                  itemCount: followingListData.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    final Follow followData = followingListData[index];
                    return ref
                        .watch(
                          watchUserDataControllerProvider(
                            followData.followingUserId,
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
