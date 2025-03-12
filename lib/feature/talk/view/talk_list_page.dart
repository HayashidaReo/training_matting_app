import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/talk/controller/talk_controller.dart';
import 'package:matching_app/feature/talk/model/talk.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class TalkListPage extends ConsumerWidget {
  const TalkListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('メッセージ一覧')),
      body: ref
          .watch(watchAllTalkRoomListControllerProvider)
          .when(
            error: (error, stackTrace) {
              return Text('エラーが発生しました');
            },
            loading: () {
              return const CircularProgressIndicator();
            },
            data: (List<Talk> talkList) {
              return ListView.builder(
                itemCount: talkList.length,
                itemBuilder: (context, index) {
                  final Talk talkData = talkList[index];
                  final String targetUserId = talkData.userIds.firstWhere(
                    (element) =>
                        element != ref.read(currentUserControllerProvider)!.uid,
                  );
                  return ref
                      .watch(watchUserDataControllerProvider(targetUserId))
                      .when(
                        error: (error, _) {
                          return Center(child: Text('エラーが発生しました'));
                        },
                        loading: () {
                          return Center(child: CircularProgressIndicator());
                        },
                        data: (UserData? targetUserData) {
                          if (targetUserData == null) {
                            return const Text('ユーザーが見つかりません');
                          }
                          return ListTile(
                            title: Text('${targetUserData.userName}'),
                            onTap: () {
                              context.pushNamed(
                                AppRoute.talkRoom.name,
                                queryParameters: {'targetUserId': targetUserId},
                              );
                            },
                          );
                        },
                      );
                },
              );
            },
          ),
    );
  }
}
