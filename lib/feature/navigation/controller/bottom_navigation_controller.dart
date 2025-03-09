import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_controller.g.dart';

@Riverpod(keepAlive: true)
class BottomNavigationController extends _$BottomNavigationController {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}
