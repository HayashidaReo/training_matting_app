enum AppRoute {
  authTopNavigation,
  passwordRemainder,
  postList,
  enlargedPostImage,
  enlargedPostImageFromAdd,
  enlargedPostImageFromEdit,
  addPost,
  editPost,
  userList,
  otherUserProfile,
  talkList,
  talkRoom,
  enlargedTalkImage,
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
      case AppRoute.enlargedPostImage:
        return '/enlargedPostImage';
      case AppRoute.addPost:
        return '/addPost';
      case AppRoute.enlargedPostImageFromAdd:
        return 'enlargedPostImageFromAdd';
      case AppRoute.editPost:
        return '/editPost';
      case AppRoute.enlargedPostImageFromEdit:
        return 'enlargedPostImageFromEdit';
      case AppRoute.userList:
        return '/userList';
      case AppRoute.otherUserProfile:
        return '/otherUserProfile';
      case AppRoute.talkList:
        return '/talkList';
      case AppRoute.talkRoom:
        return '/talkRoom';
      case AppRoute.enlargedTalkImage:
        return 'enlargedTalkImage';
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
