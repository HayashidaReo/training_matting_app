import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/user_list_tile.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/follow/data_model/follow.dart';
import 'package:matching_app/feature/user/controller/follow_list_top_navigation_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';

class FollowerListPage extends ConsumerWidget {
  const FollowerListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String targetUserId = ref.read(currentUserControllerProvider)!.uid;
    final int selectedTabIndex = ref.watch(
      followListTopNavigationControllerProvider,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ref
            .watch(watchAllFollowMeUserListControllerProvider(targetUserId))
            .when(
              error: (error, _) {
                return const Center(child: Text('エラーが発生しました'));
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
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
