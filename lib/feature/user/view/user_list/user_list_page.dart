import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/user_list_tile.dart';
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
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      TextField(
                        controller: searchTextController,
                        decoration: textFieldDecoration('ユーザー検索'),
                        onChanged: (text) {
                          searchText.value = text;
                        },
                      ),
                      Positioned(
                        right: 5,
                        top: 10,
                        bottom: 10,
                        child: IconButton(
                          icon: const Icon(Icons.search),
                          iconSize: 24,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.sort_outlined),
                  onSelected: (value) async {
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
                      const PopupMenuItem(value: 'all', child: Text('全てのユーザー')),
                    ];
                  },
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
                        // // whereではフィルターを１つしかかけれないので、ここでフィルターをかける
                        // final List<UserData> filteredUserDataList =
                        //     userDataList
                        //         .where(
                        //           (user) =>
                        //               user.userId !=
                        //               ref
                        //                   .read(currentUserControllerProvider)!
                        //                   .uid,
                        //         )
                        //         .toList();

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
