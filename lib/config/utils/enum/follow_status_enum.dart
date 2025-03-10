/// ユーザー間のフォロー状態を表す
enum FollowStatus {
  /// 自分が相手をフォローしているが、相手は自分をフォローしていない状態
  followingOnly,

  /// 相手が自分をフォローしているが、自分は相手をフォローしていない状態
  followedOnly,

  /// どちらもフォローしていない状態
  notFollowing,

  /// お互いにフォローしている状態（相互フォロー）
  mutualFollow,
}

extension FollowStatusExtention on FollowStatus {
  String get path {
    switch (this) {
      case FollowStatus.followingOnly:
        return 'followingOnly';
      case FollowStatus.followedOnly:
        return 'followedOnly';
      case FollowStatus.notFollowing:
        return 'notFollowing';
      case FollowStatus.mutualFollow:
        return 'mutualFollow';
    }
  }
}
