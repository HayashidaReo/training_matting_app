import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_list_top_navigation_controller.g.dart';

@Riverpod(keepAlive: true)
class PostListTopNavigationController
    extends _$PostListTopNavigationController {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}
