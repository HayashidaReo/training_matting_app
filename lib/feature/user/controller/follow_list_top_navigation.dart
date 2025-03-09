import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_list_top_navigation.g.dart';

@Riverpod(keepAlive: true)
class FollowListTopNavigation extends _$FollowListTopNavigation {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}
