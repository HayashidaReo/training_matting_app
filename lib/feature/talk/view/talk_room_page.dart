import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/talk_message_text_field.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';

class TalkRoomPage extends HookConsumerWidget {
  const TalkRoomPage({super.key, required this.targetUserId});

  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> userIds = [
      ref.read(currentUserControllerProvider)!.uid,
      targetUserId,
    ];
    userIds.sort();
    final talkRoomId = '${userIds[0]}_${userIds[1]}';

    final TextEditingController messageTextController =
        useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text(targetUserId)),
      body: ref
          .watch(watchAllTalkHistoryControllerProvider(talkRoomId))
          .when(
            error: (error, _) {
              return Center(child: Text('エラーが発生しました'));
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
            data: (talkHistoryDataList) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: talkHistoryDataList.length,
                      itemBuilder:
                          (context, index) => Center(
                            child: Text(talkHistoryDataList[index].message),
                          ),
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    width: double.infinity,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.photo, size: 24),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: TalkMessageTextField(
                              controller: messageTextController,
                              label: 'メッセージを入力',
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(talkHistoryControllerProvider.notifier)
                                .addTalkHistory(
                                  message: messageTextController.text,
                                  imageUrl: '',
                                  talkRoomId: talkRoomId,
                                );
                          },
                          icon: Icon(
                            Icons.send,
                            size: 24,
                            color: defaultColors.blueTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}
