import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_list_top_navigation_controller.g.dart';

@Riverpod(keepAlive: true)
class FollowListTopNavigationController
    extends _$FollowListTopNavigationController {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}
