import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';
import 'package:matching_app/feature/component/user_list_tile.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
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
        title: Stack(
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ref
            .watch(
              watchForwardMatchingWithQueryTextUsersControllerProvider(
                searchText.value,
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
            ),
      ),
    );
  }
}
