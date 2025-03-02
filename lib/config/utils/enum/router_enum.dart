enum AppRoute { auth, tweetList, userList, talkList, myPage }

extension AppRouteExtention on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.auth:
        return '/auth';
      case AppRoute.tweetList:
        return '/tweetList';
      case AppRoute.userList:
        return '/userList';
      case AppRoute.talkList:
        return '/talkList';
      case AppRoute.myPage:
        return '/myPage';
    }
  }
}
