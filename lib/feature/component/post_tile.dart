import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/confirm_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/bookmark/controller/bookmark_controller.dart';
import 'package:matching_app/feature/bookmark/model/bookmark.dart';
import 'package:matching_app/feature/component/expandable_text.dart';
import 'package:matching_app/feature/component/full_width_image.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/favorite/controller/favorite_controller.dart';
import 'package:matching_app/feature/favorite/model/favorite.dart';
import 'package:matching_app/feature/navigation/controller/popup_menu_controller.dart';
import 'package:matching_app/feature/post/controller/post_controller.dart';
import 'package:matching_app/feature/post/model/post.dart';
import 'package:matching_app/feature/user/controller/storage_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class PostTile extends HookConsumerWidget {
  PostTile({
    super.key,
    required this.postData,
    required this.postUser,
    required this.isMe,
    this.isBookmarked,
  });

  final Post postData;
  final UserData postUser;
  final bool isMe;
  final bool? isBookmarked;

  final String uid = FirebaseAuth.instance.currentUser?.uid ?? '取得失敗';
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            leading: IconImage(
              iconImageUrl: postUser.iconImageUrl,
              size: 44,
              onTap: () async {
                context.pushNamed(
                  AppRoute.otherUserProfile.name,
                  queryParameters: {'userId': postUser.userId},
                );
              },
            ),
            trailing:
                (isMe)
                    ? PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      // メニューを選択しないままbottomNavigationBarをタップするとエラーが発生するため、onOpenedとonCanceledで状態を更新
                      onOpened: () {
                        ref
                            .read(popupMenuControllerProvider.notifier)
                            .updateState(true);
                      },
                      onCanceled: () {
                        ref
                            .read(popupMenuControllerProvider.notifier)
                            .updateState(false);
                      },
                      onSelected: (value) async {
                        ref
                            .read(popupMenuControllerProvider.notifier)
                            .updateState(false);
                        if (value == 'edit') {
                          context.goNamed(
                            AppRoute.editPost.name,
                            queryParameters: {'postId': postData.postId},
                          );
                        } else if (value == 'delete') {
                          showConfirmDialog(
                            context: context,
                            text: '本当に削除しますか？\nこの操作は取り消せません。',
                            onPressed: () async {
                              context.pop();
                              _deletePost(ref);
                            },
                          );
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(value: 'edit', child: Text('編集')),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('削除'),
                          ),
                        ];
                      },
                    )
                    : SizedBox.shrink(),
            title: InkWell(
              onTap: () {
                context.pushNamed(
                  AppRoute.otherUserProfile.name,
                  queryParameters: {'userId': postUser.userId},
                );
              },
              child: Text(
                postUser.userName,
                style: TextStyle(
                  fontSize: FontSize.normal,
                  color:
                      (postUser.gender == '男性')
                          ? defaultColors.femaleColor
                          : defaultColors.maleColor,
                ),
              ),
            ),
            subtitle: Text(
              postData.createdAt.toDate().toString().substring(0, 16),
              style: TextStyle(
                fontSize: FontSize.small,
                color: defaultColors.postTileTextColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ExpandableText(
                      text: postData.body,
                      style: TextStyle(fontSize: FontSize.small),
                      maxLines: 7,
                    ),
                  ],
                ),
                if (postData.imageUrl.isNotEmpty) HeightMarginSizedBox.small,
                if (postData.imageUrl.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                      onTap: () {
                        context.goNamed(
                          AppRoute.enlargedPostImage.name,
                          queryParameters: {'imageUrl': postData.imageUrl},
                        );
                      },
                      child: FullWidthImage(imageUrl: postData.imageUrl),
                    ),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ref
                  .watch(watchAllFavoritesControllerProvider(postData.postId))
                  .when(
                    error: (error, _) {
                      return const Text('エラー');
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                    data: (List<Favorite> favoriteListData) {
                      bool isFavorite = favoriteListData.any(
                        (doc) => doc.userId == uid,
                      );
                      int favoriteCount = favoriteListData.length;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon:
                                (isFavorite)
                                    ? Icon(
                                      Icons.favorite,
                                      color: defaultColors.postFavoriteColor,
                                    )
                                    : const Icon(Icons.favorite_border),
                            onPressed: () async {
                              await _addOrDeleteFavorite(isFavorite, ref);
                            },
                          ),
                          Text(
                            favoriteCount.toString(),
                            style: TextStyle(fontSize: FontSize.small),
                          ),
                        ],
                      );
                    },
                  ),
              (isBookmarked == null)
                  ? ref
                      .watch(
                        watchAllBookmarksControllerProvider(postData.postId),
                      )
                      .when(
                        error: (error, _) {
                          return const Text('エラー');
                        },
                        loading: () {
                          return const CircularProgressIndicator();
                        },
                        data: (List<Bookmark> bookmarkListData) {
                          bool isBookmarked = bookmarkListData.any(
                            (doc) => doc.userId == uid,
                          );

                          return IconButton(
                            icon:
                                (isBookmarked)
                                    ? Icon(
                                      Icons.bookmark,
                                      color: defaultColors.postBookmarkColor,
                                    )
                                    : const Icon(Icons.bookmark_border),
                            onPressed: () async {
                              await _addOrDeleteBookmark(isBookmarked, ref);
                            },
                          );
                        },
                      )
                  : IconButton(
                    icon:
                        (isBookmarked!)
                            ? const Icon(Icons.bookmark)
                            : const Icon(Icons.bookmark_border),
                    onPressed: () async {
                      await _addOrDeleteBookmark(isBookmarked!, ref);
                    },
                  ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _addOrDeleteFavorite(bool isFavorite, WidgetRef ref) async {
    if (isFavorite) {
      // いいねを削除
      await ref
          .read(favoriteControllerProvider.notifier)
          .deleteFavorite(postData.postId, uid);
    } else {
      // いいねを追加
      await ref
          .watch(favoriteControllerProvider.notifier)
          .addFavorite(postData.postId);
    }
    return;
  }

  Future<void> _addOrDeleteBookmark(bool isBookmarked, WidgetRef ref) async {
    if (isBookmarked) {
      // ブックマークを削除
      ref
          .read(bookmarkControllerProvider.notifier)
          .deleteBookmark(postData.postId, uid);
    } else {
      // ブックマークを追加
      await ref
          .read(bookmarkControllerProvider.notifier)
          .addBookmark(postData.postId);
    }
    return;
  }

  Future<void> _deletePost(WidgetRef ref) async {
    // 画像を削除
    if (postData.imageUrl.isNotEmpty) {
      ref
          .read(storageControllerProvider.notifier)
          .deleteImage(
            folderName: FirebaseStorageKey.postImageCollection,
            docId: postData.postId,
          );
    }
    // 削除
    ref.watch(postControllerProvider.notifier).deletePost(postData.postId);
    showToast('削除しました');
    return;
  }
}
