import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/decoration/none_border_text_field_decoration.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/component/user_list_tile.dart';
import 'package:matching_app/feature/navigation/controller/popup_menu_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/controller/user_list_status_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class UserListPage extends HookConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTextController =
        useTextEditingController();
    final searchText = useState<String>('');

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          children: [
            HeightMarginSizedBox.small,
            Stack(
              children: [
                TextField(
                  controller: searchTextController,
                  decoration: noneBorderTextFieldDecoration(
                    label: 'ユーザー検索',
                    prefixIconOnPressed: () {
                      null;
                    },
                    prefixIcon: SizedBox.shrink(),
                    suffixIconOnPressed:
                        (searchText.value.isNotEmpty)
                            ? () {
                              searchText.value = '';
                              searchTextController.clear();
                            }
                            : null,

                    suffixIcon: Icon(
                      (searchText.value.isEmpty)
                          ? Icons.search
                          : Icons.keyboard_backspace,
                    ),
                  ),
                  onChanged: (text) {
                    searchText.value = text;
                  },
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: PopupMenuButton(
                    icon: const Icon(Icons.sort_outlined),
                    // メニューを選択しないままbottomNavigationBarをタップするとエラーが発生するため、onOpenedとonCanceledで状態を更新
                    onOpened: () {
                      ref
                          .read(popupMenuControllerProvider.notifier)
                          .updateState(true);
                    },
                    onCanceled: () {
                      ref
                          .read(popupMenuControllerProvider.notifier)
                          .updateState(false);
                    },
                    onSelected: (value) async {
                      ref
                          .read(popupMenuControllerProvider.notifier)
                          .updateState(false);
                      if (value == 'opposite') {
                        ref
                            .read(userListStatusControllerProvider.notifier)
                            .updateIndex(0);
                      } else if (value == 'all') {
                        ref
                            .read(userListStatusControllerProvider.notifier)
                            .updateIndex(1);
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 'opposite',
                          child: Text('異性のみ'),
                        ),
                        const PopupMenuItem(
                          value: 'all',
                          child: Text('全てのユーザー'),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ref
            .watch(watchMyUserDataControllerProvider)
            .when(
              error: (error, _) {
                return const Center(child: Text('エラーが発生しました'));
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              data: (UserData? myUserData) {
                if (myUserData == null) {
                  return const Center(child: Text('ユーザー情報が取得できませんでした'));
                }
                return ref
                    .watch(
                      watchForwardMatchingWithQueryTextUsersControllerProvider(
                        searchText.value,

                        (ref.watch(userListStatusControllerProvider) == 0)
                            ? myUserData.gender
                            : null,
                      ),
                    )
                    .when(
                      error: (error, _) {
                        return const Center(child: Text('エラーが発生しました'));
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                      data: (List<UserData> userDataList) {
                        return ListView.separated(
                          itemCount: userDataList.length,
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemBuilder: (context, index) {
                            final UserData userData = userDataList[index];

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
