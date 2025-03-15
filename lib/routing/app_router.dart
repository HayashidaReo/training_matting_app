import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:matching_app/feature/auth/view/auth_top_navigation_page.dart';
import 'package:matching_app/feature/auth/view/password_remainder_page.dart';
import 'package:matching_app/feature/navigation/view/bottom_navigation_page.dart';
import 'package:matching_app/feature/post/view/add_or_edit_post_page.dart';
import 'package:matching_app/feature/post/view/enlarged_file_image_page.dart';
import 'package:matching_app/feature/post/view/enlarged_network_image_page.dart';
import 'package:matching_app/feature/post/view/post_list_top_navigation.dart';
import 'package:matching_app/feature/talk/view/talk_list_page.dart';
import 'package:matching_app/feature/talk/view/talk_room_page.dart';
import 'package:matching_app/feature/user/view/edit/edit_email_page.dart';
import 'package:matching_app/feature/user/view/edit/edit_my_icon_page.dart';
import 'package:matching_app/feature/user/view/edit/edit_my_profile_page.dart';
import 'package:matching_app/feature/user/view/my_page.dart';
import 'package:matching_app/feature/follow/view/follow_list_top_navigation_page.dart';
import 'package:matching_app/feature/user/view/user_list/other_user_profile_page.dart';
import 'package:matching_app/feature/user/view/user_list/user_list_page.dart';
import 'package:matching_app/routing/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
@riverpod
GoRouter appRouter(ref) {
  return GoRouter(
    initialLocation: AppRoute.postList.path,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    // FirebaseAuth の認証状態変化を監視
    // 変更を感知すると、通常はページ遷移時にしか実行されない redirect を実行する
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authRepoProvider.notifier).authStateChange(),
    ),

    // 認証状態に応じてリダイレクト処理を実装
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = ref.read(authRepoProvider) != null;
      final String currentPath = state.uri.toString();
      final bool onAuthPage =
          (currentPath == AppRoute.authTopNavigation.name) ||
          (currentPath ==
              '/${AppRoute.authTopNavigation.name}/${AppRoute.passwordRemainder.name}');

      // ログインしていない場合、認証ページ, パスワード再設定ページ以外なら認証ページへリダイレクト
      if (!loggedIn) {
        return onAuthPage ? null : AppRoute.authTopNavigation.path;
      }
      // ログイン済みで認証ページにいる場合はホームページへリダイレクト
      if (loggedIn && onAuthPage) {
        return AppRoute.postList.path;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.authTopNavigation.path,
        name: AppRoute.authTopNavigation.name,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: AuthTopNavigationPage());
        },
        routes: [
          GoRoute(
            path: AppRoute.passwordRemainder.path,
            name: AppRoute.passwordRemainder.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: PasswordRemainderPage());
            },
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BottomNavigationPage(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoute.postList.path,
            name: AppRoute.postList.name,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: PostListTopNavigationPage());
            },
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.addPost.path,
                name: AppRoute.addPost.name,
                pageBuilder: (context, state) {
                  return MaterialPage(child: AddOrEditPostPage());
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: AppRoute.enlargedPostImageFromAdd.path,
                    name: AppRoute.enlargedPostImageFromAdd.name,
                    pageBuilder: (context, state) {
                      final String imageUrl =
                          state.uri.queryParameters['imageUrl'] as String;
                      final String imageFilePath =
                          state.uri.queryParameters['imageFilePath'] as String;
                      if (imageFilePath.isNotEmpty) {
                        return NoTransitionPage(
                          child: EnlargedFileImagePage(
                            imageFile: File(imageFilePath),
                          ),
                        );
                      }
                      return NoTransitionPage(
                        child: EnlargedNetworkImagePage(imageUrl: imageUrl),
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.editPost.path,
                name: AppRoute.editPost.name,
                pageBuilder: (context, state) {
                  final String postId =
                      state.uri.queryParameters['postId'] as String;
                  return MaterialPage(child: AddOrEditPostPage(postId: postId));
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: AppRoute.enlargedPostImageFromEdit.path,
                    name: AppRoute.enlargedPostImageFromEdit.name,
                    pageBuilder: (context, state) {
                      final String imageUrl =
                          state.uri.queryParameters['imageUrl'] as String;
                      final String imageFilePath =
                          state.uri.queryParameters['imageFilePath'] as String;
                      if (imageFilePath.isNotEmpty) {
                        return NoTransitionPage(
                          child: EnlargedFileImagePage(
                            imageFile: File(imageFilePath),
                          ),
                        );
                      }
                      return NoTransitionPage(
                        child: EnlargedNetworkImagePage(imageUrl: imageUrl),
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.enlargedPostImage.path,
                name: AppRoute.enlargedPostImage.name,
                pageBuilder: (context, state) {
                  final imageUrl =
                      state.uri.queryParameters['imageUrl'] as String;
                  return NoTransitionPage(
                    child: EnlargedNetworkImagePage(imageUrl: imageUrl),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.userList.path,
            name: AppRoute.userList.name,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: UserListPage());
            },
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.otherUserProfile.path,
                name: AppRoute.otherUserProfile.name,
                pageBuilder: (context, state) {
                  final userId = state.uri.queryParameters['userId'] as String;
                  return MaterialPage(
                    child: OtherUserProfilePage(targetUserId: userId),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.talkList.path,
            name: AppRoute.talkList.name,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: TalkListPage());
            },
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.talkRoom.path,
                name: AppRoute.talkRoom.name,
                pageBuilder: (context, state) {
                  final targetUserId =
                      state.uri.queryParameters['targetUserId'] as String;
                  return MaterialPage(
                    child: TalkRoomPage(targetUserId: targetUserId),
                  );
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: AppRoute.enlargedTalkImage.path,
                    name: AppRoute.enlargedTalkImage.name,
                    pageBuilder: (context, state) {
                      final String imageUrl =
                          state.uri.queryParameters['imageUrl'] as String;
                      final String imageFilePath =
                          state.uri.queryParameters['imageFilePath'] as String;
                      if (imageFilePath.isNotEmpty) {
                        return NoTransitionPage(
                          child: EnlargedFileImagePage(
                            imageFile: File(imageFilePath),
                          ),
                        );
                      }
                      return NoTransitionPage(
                        child: EnlargedNetworkImagePage(imageUrl: imageUrl),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.myPage.path,
            name: AppRoute.myPage.name,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: MyPage());
            },
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.followList.path,
                name: AppRoute.followList.name,
                pageBuilder: (context, state) {
                  final targetUserId =
                      state.uri.queryParameters['targetUserId'] as String;
                  return MaterialPage(
                    child: FollowListTopNavigationPage(
                      targetUserId: targetUserId,
                    ),
                  );
                },
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.editEmail.path,
                name: AppRoute.editEmail.name,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: EditEmailPage());
                },
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.editMyIcon.path,
                name: AppRoute.editMyIcon.name,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: EditMyIconPage());
                },
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoute.editMyProfile.path,
                name: AppRoute.editMyProfile.name,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: EditMyProfilePage());
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
