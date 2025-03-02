// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:matching_app/feature/auth/view/auth_page.dart';
import 'package:matching_app/feature/auth/view/password_remainder_page.dart';
import 'package:matching_app/routing/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
@riverpod
GoRouter appRouter(ref) {
  return GoRouter(
    initialLocation: AppRoute.tweetList.path,
    navigatorKey: rootNavigatorKey,

    debugLogDiagnostics: true,
    // FirebaseAuth の認証状態変化を監視
    // 変更を感知すると、通常はページ遷移時にしか実行されない redirect を実行する
    refreshListenable: GoRouterRefreshStream(
      // TODO: repoじゃなくてcontrollerにする
      ref.watch(authRepoProvider.notifier).authStateChange(),
    ),

    // 認証状態に応じてリダイレクト処理を実装
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = ref.read(authRepoProvider) != null;
      final String currentPath = state.uri.toString();
      final bool onAuthPage =
          (currentPath == AppRoute.auth.name) ||
          (currentPath ==
              '/${AppRoute.auth.name}/${AppRoute.passwordRemainder.name}');

      // ログインしていない場合、認証ページ, パスワード再設定ページ以外なら認証ページへリダイレクト
      if (!loggedIn) {
        return onAuthPage ? null : AppRoute.auth.path;
      }
      // ログイン済みで認証ページにいる場合はホームページへリダイレクト
      if (loggedIn && onAuthPage) {
        return AppRoute.tweetList.path;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.auth.path,
        name: AppRoute.auth.name,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: AuthPage());
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
    ],
  );
}
