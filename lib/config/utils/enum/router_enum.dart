enum AppRoute {
  authTopNavigation,
  passwordRemainder,
  postList,
  addPost,
  userList,
  talkList,
  myPage,
  editMyProfile,
  editMyIcon,
  editEmail,
  followList,
}

extension AppRouteExtention on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.authTopNavigation:
        return '/authTopNavigation';
      case AppRoute.passwordRemainder:
        return '/passwordRemainder';
      case AppRoute.postList:
        return '/postList';
      case AppRoute.addPost:
        return '/addPost';
      case AppRoute.userList:
        return '/userList';
      case AppRoute.talkList:
        return '/talkList';
      case AppRoute.myPage:
        return '/myPage';
      case AppRoute.editMyIcon:
        return '/editMyIcon';
      case AppRoute.editMyProfile:
        return '/editMyProfile';
      case AppRoute.editEmail:
        return '/editEmail';
      case AppRoute.followList:
        return '/followList';
    }
  }
}
