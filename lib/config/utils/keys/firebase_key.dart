class FirebaseUserDataKey {
  //Userコレクション関連
  static String userCollection = 'users';
  static String userId = 'userId';
  static String createdAt = 'createdAt';
  static String userName = 'userName';
}

class FirebasePostDataKey {
  //Postコレクション関連
  static String postCollection = 'posts';
  static String userId = 'userId';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseBookmarkDataKey {
  //Bookmarkコレクション関連
  static String bookmarkCollection = 'bookmarks';
  static String postId = 'postId';
  static String userId = 'userId';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseFavoriteDataKey {
  //Favoriteコレクション関連
  static String favoriteCollection = 'favorites';
  static String postId = 'postId';
  static String userId = 'userId';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseFollowDataKey {
  //Followコレクション関連
  static String followCollection = 'follows';
  static String followerUserId = 'followerUserId';
  static String followingUserId = 'followingUserId';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseTalkDataKey {
  //Talkコレクション関連
  static String talkCollection = 'talks';
  static String talkRoomId = 'talkRoomId';
  static String userIds = 'userIds';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseTalkHistoryDataKey {
  //TalkHistoryコレクション関連
  static String talkHistoryCollection = 'talk_history';
  static String talkId = 'talkId';
  static String talkerUserId = 'talkerUserId';
  static String message = 'message';
  static String imageUrl = 'imageUrl';
  static String isOpened = 'isOpened';
  static String createdAt = 'createdAt';
  static String updatedAt = 'updatedAt';
}

class FirebaseStorageKey {
  //Storage関連
  static String userIconCollection = 'user_icons';
  static String postImageCollection = 'post_images';
  static String talkImageCollection = 'talk_images';
}
