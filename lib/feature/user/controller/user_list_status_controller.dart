import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_list_status_controller.g.dart';

@Riverpod(keepAlive: true)
class UserListStatusController extends _$UserListStatusController {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}
