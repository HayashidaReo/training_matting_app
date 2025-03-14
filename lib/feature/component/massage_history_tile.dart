import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/function/format_talk_timestamp.dart';
import 'package:vibration/vibration.dart';
import 'package:matching_app/common_widget/confirm_dialog.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/feature/component/auto_scaled_network_image.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class InterlocutorMassageHistoryTile extends StatelessWidget {
  const InterlocutorMassageHistoryTile({
    super.key,
    required this.talkHistoryData,
    required this.targetUserData,
  });

  final TalkHistory talkHistoryData;
  final UserData targetUserData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconImage(
            iconImageUrl: targetUserData.iconImageUrl,
            size: 36,
            onTap: () {
              context.pushNamed(
                AppRoute.otherUserProfile.name,
                queryParameters: {'userId': targetUserData.userId},
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (talkHistoryData.imageUrl.isNotEmpty)
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            8.0,
                            8.0,
                            0.0,
                            0.0,
                          ),
                          child: AutoScaledNetworkImage(
                            imageUrl: talkHistoryData.imageUrl,
                            onTap: () {
                              context.pushNamed(
                                AppRoute.enlargedTalkImage.name,
                                queryParameters: {
                                  'imageUrl': talkHistoryData.imageUrl,
                                  'imageFilePath': '',
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          formatTalkTimestamp(talkHistoryData.createdAt),
                          style: TextStyle(
                            fontSize: FontSize.small,
                            color: defaultColors.mainTextColor,
                          ),
                        ),
                      ),
                    ],
                  )
                  : SizedBox.shrink(),
              (talkHistoryData.message.isNotEmpty)
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        padding: const EdgeInsets.all(6.0),
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color:
                              defaultColors.talkRoomInterlocutorTextBackColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          talkHistoryData.message,
                          style: TextStyle(
                            color: defaultColors.talkRoomInterlocutorTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          formatTalkTimestamp(talkHistoryData.createdAt),
                          style: TextStyle(
                            fontSize: FontSize.small,
                            color: defaultColors.mainTextColor,
                          ),
                        ),
                      ),
                    ],
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}

class MyMassageHistoryTile extends StatelessWidget {
  const MyMassageHistoryTile({
    super.key,
    required this.talkHistoryData,
    required this.talkRoomId,
    required this.onPressed,
  });

  final TalkHistory talkHistoryData;
  final String talkRoomId;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onLongPressUp: () async {
          if (await Vibration.hasVibrator()) {
            Vibration.vibrate(duration: 100); // 500ミリ秒振動
          }
          if (context.mounted) {
            showConfirmDialog(
              context: context,
              text: '送信を取り消しますか？',
              onPressed: () {
                // 送信取り消し
                onPressed();
              },
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (talkHistoryData.imageUrl.isNotEmpty)
                    ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            formatTalkTimestamp(talkHistoryData.createdAt),
                            style: TextStyle(
                              fontSize: FontSize.small,
                              color: defaultColors.mainTextColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0.0,
                              8.0,
                              8.0,
                              0.0,
                            ),
                            child: AutoScaledNetworkImage(
                              imageUrl: talkHistoryData.imageUrl,
                              onTap: () {
                                context.pushNamed(
                                  AppRoute.enlargedTalkImage.name,
                                  queryParameters: {
                                    'imageUrl': talkHistoryData.imageUrl,
                                    'imageFilePath': '',
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                    : SizedBox.shrink(),
                (talkHistoryData.message.isNotEmpty)
                    ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            formatTalkTimestamp(talkHistoryData.createdAt),
                            style: TextStyle(
                              fontSize: FontSize.small,
                              color: defaultColors.mainTextColor,
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          padding: const EdgeInsets.all(6.0),
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: defaultColors.talkRoomMyTextBackColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            talkHistoryData.message,
                            style: TextStyle(
                              color: defaultColors.talkRoomMyTextColor,
                            ),
                          ),
                        ),
                      ],
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
