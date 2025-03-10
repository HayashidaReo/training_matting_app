import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/decoration/text_field_decoration.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/follow/controller/follow_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';

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
                    return ListTile(
                      leading:
                          (userData.iconImageUrl.isEmpty)
                              ? ClipOval(
                                child: Image.asset(
                                  'assets/images/default_user_icon.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              )
                              : CachedNetworkImage(
                                imageUrl: userData.iconImageUrl,
                                imageBuilder:
                                    (context, imageProvider) => ClipOval(
                                      child: Image(
                                        image: imageProvider,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                progressIndicatorBuilder: (
                                  context,
                                  url,
                                  downloadProgress,
                                ) {
                                  return SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Icon(
                                      Icons.image_not_supported_rounded,
                                    ),
                                  );
                                },
                              ),
                      title: Text(userData.userName),
                      onTap: () async {
                        context.pushNamed(
                          AppRoute.otherUserProfile.name,
                          queryParameters: {'userId': userData.userId},
                        );
                        // ref
                        //     .read(followControllerProvider.notifier)
                        //     .createFollow(userData.userId);
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
