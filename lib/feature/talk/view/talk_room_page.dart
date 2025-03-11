import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/component/talk_message_text_field.dart';
import 'package:matching_app/feature/component/un_focus.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';

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
    useValueListenable(messageTextController); // 入力状態に応じて画面表示を変えるため

    return ref
        .watch(watchUserDataControllerProvider(targetUserId))
        .when(
          error: (error, _) {
            return Center(child: Text('エラーが発生しました'));
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          data: (targetUserData) {
            if (targetUserData == null) {
              return Center(child: Text('ユーザーが見つかりません'));
            }
            return Scaffold(
              appBar: AppBar(title: Text(targetUserData.userName)),
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
                      return UnFocus(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  itemCount: talkHistoryDataList.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        (talkHistoryDataList[index]
                                                    .talkerUserId ==
                                                ref
                                                    .read(
                                                      currentUserControllerProvider,
                                                    )!
                                                    .uid)
                                            ? Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          6.0,
                                                        ),
                                                    margin:
                                                        const EdgeInsets.all(
                                                          6.0,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          defaultColors
                                                              .blueTextColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12.0,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      talkHistoryDataList[index]
                                                          .message,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            : Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  IconImage(
                                                    iconImageUrl:
                                                        targetUserData
                                                            .iconImageUrl,
                                                    size: 36,
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          6.0,
                                                        ),
                                                    margin:
                                                        const EdgeInsets.all(
                                                          6.0,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          defaultColors
                                                              .unavailableFrontGreyColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12.0,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      talkHistoryDataList[index]
                                                          .message,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ],
                                    );
                                  },
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
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                      ),
                                      child: TalkMessageTextField(
                                        controller: messageTextController,
                                        label: 'メッセージを入力',
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (messageTextController.text
                                          .trim()
                                          .isEmpty) {
                                        return;
                                      }
                                      ref
                                          .read(
                                            talkHistoryControllerProvider
                                                .notifier,
                                          )
                                          .addTalkHistory(
                                            message: messageTextController.text,
                                            imageUrl: '',
                                            talkRoomId: talkRoomId,
                                          );
                                      messageTextController.clear();
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      size: 24,
                                      color:
                                          (messageTextController.text.isEmpty)
                                              ? defaultColors
                                                  .unavailableFrontGreyColor
                                              : defaultColors.blueTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            );
          },
        );
  }
}
