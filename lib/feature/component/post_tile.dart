import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/common_widget/confirm_dialog.dart';
import 'package:matching_app/common_widget/toast.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/width_margin_sized_box.dart';
import 'package:matching_app/feature/post/data_model/post.dart';
import 'package:matching_app/feature/post/repo/post_repo.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';

class PostTile extends HookConsumerWidget {
  PostTile({
    super.key,
    required this.post,
    required this.postUser,
    required this.isMe,
    this.isBookmarked,
  });

  final Post post;
  final UserData postUser;
  final bool isMe;
  final bool? isBookmarked;

  final String uid = FirebaseAuth.instance.currentUser?.uid ?? '取得失敗';
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      color: defaultColors.postTileBackColor,
      child: Column(
        children: [
          ListTile(
            leading:
                (postUser.iconImageUrl != '')
                    ? CachedNetworkImage(
                      imageUrl: postUser.iconImageUrl,
                      imageBuilder:
                          (context, imageProvider) => ClipOval(
                            child: Image(
                              image: imageProvider,
                              width: 44,
                              height: 44,
                              fit: BoxFit.cover,
                            ),
                          ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => SizedBox(
                            width: 44,
                            height: 44,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => SizedBox(
                            width: 44,
                            height: 44,
                            child: Icon(Icons.image_not_supported_rounded),
                          ),
                    )
                    : ClipOval(
                      child: Image.asset(
                        'assets/images/default_user_icon.png',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),

            trailing:
                (isMe)
                    ? IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () async {
                        showConfirmDialog(
                          context: context,
                          text: '本当に削除しますか？\nこの操作は取り消せません。',
                          onPressed: () async {
                            context.pop();
                            // 画像を削除
                            if (post.imageUrl.isNotEmpty) {
                              await FirebaseStorage.instance
                                  .refFromURL(post.imageUrl)
                                  .delete();
                            }
                            // 削除
                            ref
                                .watch(postRepoProvider.notifier)
                                .deletePost(post.postId);
                            showToast('削除しました');
                          },
                        );
                      },
                    )
                    : SizedBox.shrink(),
            title: Text(
              postUser.userName,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text(
              post.createdAt.toDate().toString().substring(0, 16),
              style: TextStyle(
                fontSize: 11,
                color: defaultColors.postTileTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              color: defaultColors.postTileBackColor,

              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (post.imageUrl.isNotEmpty)
                    CachedNetworkImage(
                      imageUrl: post.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (
                        context,
                        url,
                        downloadProgress,
                      ) {
                        return SizedBox(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return SizedBox(
                          width: 80,
                          height: 80,
                          child: Icon(Icons.image_not_supported_rounded),
                        );
                      },
                    ),
                  if (post.imageUrl.isNotEmpty) WidthMarginSizedBox.small,
                  Flexible(
                    child: Text(
                      post.body,
                      style: TextStyle(fontSize: FontSize.small),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     ref
          //         .watch(watchAllFavoritesProvider(post.postId))
          //         .when(
          //           error: (error, _) {
          //             return const Text('エラー');
          //           },
          //           loading: () {
          //             return const CircularProgressIndicator();
          //           },
          //           data: (List<Favorite> favoriteListData) {
          //             bool isFavorite = favoriteListData.any(
          //               (doc) => doc.userId == uid,
          //             );
          //             int favoriteCount = favoriteListData.length;
          //             return Row(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 IconButton(
          //                   icon:
          //                       (isFavorite)
          //                           ? const Icon(Icons.favorite)
          //                           : const Icon(Icons.favorite_border),
          //                   onPressed: () async {
          //                     if (isFavorite) {
          //                       // いいねを削除
          //                       await ref
          //                           .read(
          //                             favoriteRepoProvider(
          //                               post.postId,
          //                             ).notifier,
          //                           )
          //                           .deleteFavorite(uid);
          //                     } else {
          //                       // いいねを追加
          //                       final Timestamp now = Timestamp.now();
          //                       final Favorite addFavoriteData = Favorite(
          //                         userId: uid,
          //                         postId: post.postId,
          //                         createdAt: now,
          //                         updatedAt: now,
          //                       );
          //                       await ref
          //                           .watch(
          //                             favoriteRepoProvider(
          //                               post.postId,
          //                             ).notifier,
          //                           )
          //                           .addFavorite(addFavoriteData);
          //                     }
          //                   },
          //                 ),
          //                 Text(
          //                   favoriteCount.toString(),
          //                   style: TextStyle(fontSize: FontSize.small),
          //                 ),
          //               ],
          //             );
          //           },
          //         ),
          //     (isBookmarked == null)
          //         ? ref
          //             .watch(watchAllBookmarksProvider(post.postId))
          //             .when(
          //               error: (error, _) {
          //                 return const Text('エラー');
          //               },
          //               loading: () {
          //                 return const CircularProgressIndicator();
          //               },
          //               data: (List<Bookmark> bookmarkListData) {
          //                 bool isBookmarked = bookmarkListData.any(
          //                   (doc) => doc.userId == uid,
          //                 );

          //                 return IconButton(
          //                   icon:
          //                       (isBookmarked)
          //                           ? const Icon(Icons.bookmark)
          //                           : const Icon(Icons.bookmark_border),
          //                   onPressed: () async {
          //                     if (isBookmarked) {
          //                       // ブックマークを削除
          //                       ref
          //                           .read(
          //                             bookmarkRepoProvider(
          //                               post.postId,
          //                             ).notifier,
          //                           )
          //                           .deleteBookmark(uid);
          //                     } else {
          //                       final Timestamp now = Timestamp.now();
          //                       final Bookmark addBookmarkData = Bookmark(
          //                         userId: uid,
          //                         postId: post.postId,
          //                         createdAt: now,
          //                         updatedAt: now,
          //                       );
          //                       await ref
          //                           .read(
          //                             bookmarkRepoProvider(
          //                               post.postId,
          //                             ).notifier,
          //                           )
          //                           .addBookmark(addBookmarkData);
          //                     }
          //                   },
          //                 );
          //               },
          //             )
          //         : IconButton(
          //           icon:
          //               (isBookmarked!)
          //                   ? const Icon(Icons.bookmark)
          //                   : const Icon(Icons.bookmark_border),
          //           onPressed: () async {
          //             if (isBookmarked!) {
          //               // ブックマークを削除
          //               ref
          //                   .read(bookmarkRepoProvider(post.postId).notifier)
          //                   .deleteBookmark(uid);
          //             } else {
          //               final Timestamp now = Timestamp.now();
          //               final Bookmark addBookmarkData = Bookmark(
          //                 userId: uid,
          //                 postId: post.postId,
          //                 createdAt: now,
          //                 updatedAt: now,
          //               );
          //               await ref
          //                   .read(bookmarkRepoProvider(post.postId).notifier)
          //                   .addBookmark(addBookmarkData);
          //             }
          //           },
          //         ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
