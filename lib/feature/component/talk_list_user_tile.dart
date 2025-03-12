import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/badge_count_widget.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';
import 'package:matching_app/feature/talk/model/talk.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:matching_app/feature/user/model/userdata.dart';
import 'package:matching_app/function/format_talk_timestamp.dart';

class TalkListUserTile extends ConsumerWidget {
  const TalkListUserTile({
    super.key,
    required this.targetUserId,
    required this.talkData,
    required this.targetUserData,
  });

  final String targetUserId;
  final Talk talkData;
  final UserData targetUserData;

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      leading: IconImage(
        iconImageUrl: targetUserData.iconImageUrl,
        size: 60,
        onTap: () {
          context.pushNamed(
            AppRoute.otherUserProfile.name,
            queryParameters: {'userId': targetUserId},
          );
        },
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            formatTalkTimestamp(talkData.updatedAt),
            style: TextStyle(fontSize: FontSize.extraSmall),
          ),
          ref
              .watch(
                watchNotOpenedTalkHistoryCountControllerProvider(
                  talkData.talkRoomId,
                ),
              )
              .when(
                error: (error, _) {
                  return const Text('エラーが発生しました');
                },
                loading: () {
                  return const SizedBox.shrink();
                },
                data: (int notOpenedCount) {
                  if (notOpenedCount == 0) {
                    return const SizedBox(height: 21);
                  } else {
                    return badgeCountWidget(ref, notOpenedCount);
                  }
                },
              ),
        ],
      ),
      title: Text(
        targetUserData.userName,
        style: TextStyle(
          fontSize: FontSize.normal,
          color:
              (targetUserData.gender == '男性')
                  ? defaultColors.femaleColor
                  : defaultColors.maleColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: ref
          .watch(watchLatestTalkHistoryControllerProvider(talkData.talkRoomId))
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
                    ref.read(currentUserControllerProvider)!.uid) {
                  return const Text('画像を送信しました');
                } else {
                  return const Text('画像が送信されました');
                }
              }
              return Text(
                latestTalkHistoryData.message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: FontSize.small),
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
  }
}
