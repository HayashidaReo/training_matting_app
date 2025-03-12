import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/talk/controller/talk_controller.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';
import 'package:matching_app/feature/talk/model/talk.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';
import 'package:matching_app/function/format_talk_timestamp.dart';

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
                          return Center(child: CircularProgressIndicator());
                        },
                        data: (UserData? targetUserData) {
                          if (targetUserData == null) {
                            return const Text('ユーザーが見つかりません');
                          }
                          return ListTile(
                            leading: IconImage(
                              iconImageUrl: targetUserData.iconImageUrl,
                              size: 60,
                            ),
                            trailing: Text(
                              formatTalkTimestamp(talkData.updatedAt),
                              style: TextStyle(fontSize: FontSize.extraSmall),
                            ),
                            title: Text(
                              targetUserData.userName,
                              style: TextStyle(fontSize: FontSize.normal),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: ref
                                .watch(
                                  watchLatestTalkHistoryControllerProvider(
                                    talkData.talkRoomId,
                                  ),
                                )
                                .when(
                                  error: (error, _) {
                                    return const Text('エラーが発生しました');
                                  },
                                  loading: () {
                                    return const Text('読み込み中...');
                                  },
                                  data: (TalkHistory? latestTalkHistoryData) {
                                    if (latestTalkHistoryData == null) {
                                      return const Text('まだメッセージがありません');
                                    }
                                    if (latestTalkHistoryData.message.isEmpty) {
                                      if (latestTalkHistoryData.talkerUserId ==
                                          ref
                                              .read(
                                                currentUserControllerProvider,
                                              )!
                                              .uid) {
                                        return const Text('画像を送信しました');
                                      } else {
                                        return const Text('画像が送信されました');
                                      }
                                    }
                                    return Text(
                                      latestTalkHistoryData.message,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: FontSize.small,
                                      ),
                                    );
                                  },
                                ),
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
