import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/auto_scaled_image.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/component/talk_message_text_field.dart';
import 'package:matching_app/feature/component/un_focus.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:matching_app/feature/user/controller/storage_controller.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/function/get_image_from_gallery.dart';
import 'package:uuid/uuid.dart';

class TalkRoomPage extends HookConsumerWidget {
  const TalkRoomPage({super.key, required this.targetUserId});

  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<File?> uploadedImageFile = useState(null);
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
                                    final TalkHistory talkHistoryData =
                                        talkHistoryDataList[index];
                                    return Row(
                                      children: [
                                        (talkHistoryData.talkerUserId ==
                                                ref
                                                    .read(
                                                      currentUserControllerProvider,
                                                    )!
                                                    .uid)
                                            ? MyMassageHistoryTile(
                                              talkHistoryData: talkHistoryData,
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
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  uploadedImageFile.value != null
                                      ? Stack(
                                        children: [
                                          Image.file(
                                            uploadedImageFile.value!,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: defaultColors
                                                    .textBlackColor
                                                    .withAlpha(150),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: () {
                                                    uploadedImageFile.value =
                                                        null;
                                                  },
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color:
                                                        defaultColors
                                                            .mainButtonTextWhiteColor,
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                      : Container(),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          // 画像を選択
                                          await _getImage(uploadedImageFile);
                                        },
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
                                          // 送信
                                          _sendMassage(
                                            messageTextController:
                                                messageTextController,
                                            uploadedImageFile:
                                                uploadedImageFile,
                                            ref: ref,
                                            talkRoomId: talkRoomId,
                                            context: context,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.send,
                                          size: 24,
                                          color:
                                              (messageTextController
                                                          .text
                                                          .isEmpty &&
                                                      uploadedImageFile.value ==
                                                          null)
                                                  ? defaultColors
                                                      .unavailableFrontGreyColor
                                                  : defaultColors.blueTextColor,
                                        ),
                                      ),
                                    ],
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

  Future<void> _getImage(ValueNotifier<File?> uploadedImageFile) async {
    final uploadResult = await getImageFromGallery();
    if (uploadResult != null) {
      uploadedImageFile.value = uploadResult;
    }
    return;
  }

  void _sendMassage({
    required TextEditingController messageTextController,
    required ValueNotifier<File?> uploadedImageFile,
    required WidgetRef ref,
    required String talkRoomId,
    required BuildContext context,
  }) async {
    if (messageTextController.text.trim().isEmpty &&
        uploadedImageFile.value == null) {
      return;
    }
    String imageUrl = '';
    String talkId = const Uuid().v4();
    if (uploadedImageFile.value != null) {
      imageUrl = await ref
          .read(storageControllerProvider.notifier)
          .uploadImageAndGetUrl(
            folderName: '${FirebaseStorageKey.talkImageCollection}/$talkRoomId',
            imageFile: uploadedImageFile.value!,
            docId: talkId,
          );
    }
    ref
        .read(talkHistoryControllerProvider.notifier)
        .addTalkHistory(
          message: messageTextController.text,
          imageUrl: imageUrl,
          talkRoomId: talkRoomId,
          talkId: talkId,
        );
    messageTextController.clear();
    uploadedImageFile.value = null;
    return;
  }
}

class MyMassageHistoryTile extends StatelessWidget {
  const MyMassageHistoryTile({super.key, required this.talkHistoryData});

  final TalkHistory talkHistoryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              (talkHistoryData.imageUrl.isNotEmpty)
                  ? Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: AutoScaledImage(
                        imageUrl: talkHistoryData.imageUrl,
                        targetMinSide: 170,
                        fit: BoxFit.contain,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
              (talkHistoryData.message.isNotEmpty)
                  ? Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    padding: const EdgeInsets.all(6.0),
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: defaultColors.blueTextColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),

                    child: Text(
                      talkHistoryData.message,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
