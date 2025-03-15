import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/talk_list_user_tile.dart';
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
              return const CupertinoActivityIndicator();
            },
            data: (List<Talk> talkList) {
              return ListView.separated(
                itemCount: talkList.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
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
                          return Center(child: CupertinoActivityIndicator());
                        },
                        data: (UserData? targetUserData) {
                          if (targetUserData == null) {
                            return const Text('ユーザーが見つかりません');
                          }
                          return TalkListUserTile(
                            targetUserId: targetUserId,
                            talkData: talkData,
                            targetUserData: targetUserData,
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
