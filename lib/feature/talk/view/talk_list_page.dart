import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/talk/controller/talk_controller.dart';
import 'package:matching_app/feature/talk/model/talk.dart';

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
                  return ListTile(
                    title: Text('Talk ${talkData.talkRoomId}'),
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
          ),
    );
  }
}
