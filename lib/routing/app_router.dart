// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:matching_app/feature/auth/view/auth_page.dart';
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
      if (ref.read(authRepoProvider) == null) {
        return AppRoute.auth.path;
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
      ),
    ],
  );
}
