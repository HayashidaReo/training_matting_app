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
  static String updateAt = 'updateAt';
}

class FirebaseBookmarkDataKey {
  //Postコレクション関連
  static String bookmarkCollection = 'bookmarks';
  static String postId = 'postId';
  static String userId = 'userId';
  static String createdAt = 'createdAt';
  static String updateAt = 'updateAt';
}

class FirebaseFavoriteDataKey {
  //Postコレクション関連
  static String favoriteCollection = 'favorites';
  static String postId = 'postId';
  static String userId = 'userId';
  static String createdAt = 'createdAt';
  static String updateAt = 'updateAt';
}

class FirebaseFollowDataKey {
  //Followコレクション関連
  static String followCollection = 'follows';
  static String followerUserId = 'followerUserId';
  static String followingUserId = 'followingUserId';
  static String createdAt = 'createdAt';
  static String updateAt = 'updateAt';
}

class FirebaseStorageKey {
  //Storage関連
  static String userIconCollection = 'user_icons';
  static String postImageCollection = 'post_images';
}
