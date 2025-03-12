import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/component/badge_count_widget.dart';
import 'package:matching_app/feature/navigation/controller/bottom_navigation_controller.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';
import 'package:matching_app/feature/talk/repo/talk_history_repo.dart';

class BottomNavigationPage extends ConsumerWidget {
  const BottomNavigationPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(bottomNavigationControllerProvider),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'UserList'),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.message),
                Positioned(
                  top: -6,
                  right: -8,
                  child: ref
                      .watch(
                        watchAllNotOpenedTalkHistoryCountControllerProvider,
                      )
                      .when(
                        error: (error, stackTrace) {
                          return const Text('?');
                        },
                        loading: () {
                          return const CircularProgressIndicator();
                        },
                        data: (int count) {
                          return badgeCountWidget(ref, count);
                        },
                      ),
                ),
              ],
            ),
            label: 'TalkList',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'MyPage',
          ),
        ],
        onTap: (value) {
          ref
              .read(bottomNavigationControllerProvider.notifier)
              .updateIndex(value);
          switch (value) {
            case 0:
              context.goNamed(AppRoute.postList.name);
              break;
            case 1:
              context.goNamed(AppRoute.userList.name);
              break;
            case 2:
              context.goNamed(AppRoute.talkList.name);
              break;
            case 3:
              context.goNamed(AppRoute.myPage.name);
              break;
          }
        },
      ),
    );
  }
}
