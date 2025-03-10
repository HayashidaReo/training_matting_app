import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ユーザー一覧')),
      body: ref
          .watch(watchAllUsersControllerProvider)
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

                    onTap: () {},
                  );
                },
              );
            },
          ),
    );
  }
}
