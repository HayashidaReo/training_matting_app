import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popup_menu_controller.g.dart';

@Riverpod(keepAlive: true)
class PopupMenuController extends _$PopupMenuController {
  @override
  bool build() {
    return false;
  }

  void updateState(bool showState) {
    state = showState;
  }
}
