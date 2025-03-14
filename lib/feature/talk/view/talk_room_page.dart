import 'dart:io';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/common_widget/loading_dialog.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/image_quality_enum.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/component/auto_scaled_file_image.dart';
import 'package:matching_app/feature/component/massage_history_tile.dart';
import 'package:matching_app/feature/component/talk_message_text_field.dart';
import 'package:matching_app/feature/component/un_focus.dart';
import 'package:matching_app/feature/talk/controller/talk_controller.dart';
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
                  .watch(watchExistTalkRoomControllerProvider(talkRoomId))
                  .when(
                    error: (error, _) {
                      return Center(child: Text('エラーが発生しました'));
                    },
                    loading: () {
                      return Center(child: CircularProgressIndicator());
                    },
                    data: (bool isExistTalkRoom) {
                      if (!isExistTalkRoom) {
                        return Center(
                          child: Text(
                            '相互フォローではなくなったため\nトークルームが存在しません',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: defaultColors.mainTextColor,
                              fontSize: FontSize.normal,
                            ),
                          ),
                        );
                      }
                      return ref
                          .watch(
                            watchAllTalkHistoryControllerProvider(talkRoomId),
                          )
                          .when(
                            error: (error, _) {
                              return Center(child: Text('エラーが発生しました'));
                            },
                            loading: () {
                              return Center(child: CircularProgressIndicator());
                            },
                            data: (List<TalkHistory> talkHistoryDataList) {
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
                                          reverse: true,
                                          itemCount: talkHistoryDataList.length,
                                          itemBuilder: (context, index) {
                                            final TalkHistory talkHistoryData =
                                                talkHistoryDataList[index];
                                            if (!talkHistoryData.isOpened &&
                                                talkHistoryData.talkerUserId ==
                                                    targetUserId) {
                                              ref
                                                  .read(
                                                    talkHistoryControllerProvider
                                                        .notifier,
                                                  )
                                                  .openTalkHistory(
                                                    talkHistoryData:
                                                        talkHistoryData,
                                                  );
                                            }
                                            return Row(
                                              children: [
                                                (talkHistoryData
                                                            .message
                                                            .isEmpty &&
                                                        talkHistoryData
                                                            .imageUrl
                                                            .isEmpty)
                                                    ? Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              6.0,
                                                            ),
                                                        child: Center(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  6.0,
                                                                ),
                                                            child: Container(
                                                              color:
                                                                  defaultColors
                                                                      .talkRoomUndoSendBackColor,
                                                              padding:
                                                                  const EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        6,
                                                                    vertical: 2,
                                                                  ),

                                                              child: Text(
                                                                '送信が取り消されました',
                                                                style: TextStyle(
                                                                  color:
                                                                      defaultColors
                                                                          .talkRoomUndoSendTextColor,
                                                                  fontSize:
                                                                      FontSize
                                                                          .small,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    : (talkHistoryData
                                                            .talkerUserId ==
                                                        ref
                                                            .read(
                                                              currentUserControllerProvider,
                                                            )!
                                                            .uid)
                                                    ? MyMassageHistoryTile(
                                                      talkHistoryData:
                                                          talkHistoryData,
                                                      talkRoomId: talkRoomId,
                                                      onPressed: () async {
                                                        await ref
                                                            .read(
                                                              talkHistoryControllerProvider
                                                                  .notifier,
                                                            )
                                                            .deleteTalkHistory(
                                                              talkHistoryData:
                                                                  talkHistoryData,
                                                            );
                                                        if (context.mounted) {
                                                          context.pop();
                                                        }
                                                      },
                                                    )
                                                    : InterlocutorMassageHistoryTile(
                                                      talkHistoryData:
                                                          talkHistoryData,
                                                      targetUserData:
                                                          targetUserData,
                                                    ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    SafeArea(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                (uploadedImageFile.value !=
                                                        null)
                                                    ? defaultColors
                                                        .talkRoomSendMessageFieldBackColor
                                                    : null,
                                            borderRadius: BorderRadius.circular(
                                              20.0,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            children: [
                                              uploadedImageFile.value != null
                                                  ? SizedBox(
                                                    width: 200,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            6.0,
                                                          ),
                                                      child: Stack(
                                                        children: [
                                                          AutoScaledFileImage(
                                                            imageFile:
                                                                uploadedImageFile
                                                                    .value!,
                                                            onTap: () {
                                                              context.goNamed(
                                                                AppRoute
                                                                    .enlargedTalkImage
                                                                    .name,
                                                                queryParameters: {
                                                                  'targetUserId':
                                                                      targetUserId,
                                                                  'imageFilePath':
                                                                      uploadedImageFile
                                                                          .value!
                                                                          .path,
                                                                  'imageUrl':
                                                                      '',
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          Positioned(
                                                            right: 6,
                                                            top: 6,
                                                            child: Container(
                                                              height: 30,
                                                              width: 30,
                                                              decoration: BoxDecoration(
                                                                color:
                                                                    defaultColors
                                                                        .onImageIconButtonBackColor,
                                                                shape:
                                                                    BoxShape
                                                                        .circle,
                                                              ),
                                                              child: Center(
                                                                child: IconButton(
                                                                  onPressed: () {
                                                                    uploadedImageFile
                                                                            .value =
                                                                        null;
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .close_rounded,
                                                                    color:
                                                                        defaultColors
                                                                            .onImageIconButtonFrontColor,
                                                                    size: 14,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  : Container(),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                          ),
                                                      child: TalkMessageTextField(
                                                        controller:
                                                            messageTextController,
                                                        label: 'メッセージを入力',
                                                        prefixIconOnPressed:
                                                            () async {
                                                              // 画像を選択
                                                              await _getImage(
                                                                uploadedImageFile,
                                                              );
                                                            },
                                                        prefixIcon: Icon(
                                                          Icons.photo,
                                                          size: 24,
                                                        ),
                                                        suffixIconOnPressed: () {
                                                          // 送信
                                                          _sendMassage(
                                                            messageTextController:
                                                                messageTextController,
                                                            uploadedImageFile:
                                                                uploadedImageFile,
                                                            ref: ref,
                                                            talkRoomId:
                                                                talkRoomId,
                                                            context: context,
                                                          );
                                                        },
                                                        suffixIcon: Icon(
                                                          Icons.send,
                                                          size: 24,
                                                          color:
                                                              (messageTextController
                                                                          .text
                                                                          .trim()
                                                                          .isEmpty &&
                                                                      uploadedImageFile
                                                                              .value ==
                                                                          null)
                                                                  ? defaultColors
                                                                      .unavailableFrontGreyColor
                                                                  : defaultColors
                                                                      .blueTextColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                    },
                  ),
            );
          },
        );
  }

  Future<void> _getImage(ValueNotifier<File?> uploadedImageFile) async {
    final uploadResult = await getImageFromGallery(ImageQuality.talk.quality);
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
    showLoadingDialog('送信中...');
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
          message: messageTextController.text.trim(),
          imageUrl: imageUrl,
          talkRoomId: talkRoomId,
          talkId: talkId,
          targetUserId: targetUserId,
        );
    messageTextController.clear();
    uploadedImageFile.value = null;
    hideLoadingDialog();
    return;
  }
}
