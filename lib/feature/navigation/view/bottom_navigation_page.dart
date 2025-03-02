import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/routing/app_router.dart';

class BottomNavigationPage extends HookConsumerWidget {
  const BottomNavigationPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    useEffect(() {
      final String currentPath =
          ref
              .read(appRouterProvider)
              .routerDelegate
              .currentConfiguration
              .uri
              .toString();
      if (currentPath == AppRoute.tweetList.path) {
        selectedIndex.value = 0;
      } else if (currentPath == AppRoute.userList.path) {
        selectedIndex.value = 1;
      } else if (currentPath == AppRoute.talkList.path) {
        selectedIndex.value = 2;
      } else if (currentPath == AppRoute.myPage.path) {
        selectedIndex.value = 3;
      } else {
        selectedIndex.value = 0;
      }

      return null;
    }, [ref.watch(appRouterProvider).routerDelegate.currentConfiguration.uri]);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex.value,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'UserList'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'TalkList'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'MyPage',
          ),
        ],
        onTap: (value) {
          selectedIndex.value = value;
          switch (value) {
            case 0:
              context.goNamed(AppRoute.tweetList.name);
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
