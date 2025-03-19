/// スナップショットでデータを取得するときの一度に取得する件数
enum SnapshotLimit {
  allMyFollowingUser,
  allFollowMeUser,
  allOnlyIncomingFollowUser,
  allMutualFollowUser,
  allPosts,
  myAllBookmarks,
  myAllPosts,
  allTalkRoom,
  allTalkHistory,
  userList,
}

extension FollowStatusExtention on SnapshotLimit {
  int get limit {
    switch (this) {
      case SnapshotLimit.allMyFollowingUser:
        return 50;
      case SnapshotLimit.allFollowMeUser:
        return 50;
      case SnapshotLimit.allOnlyIncomingFollowUser:
        return 30;
      case SnapshotLimit.allMutualFollowUser:
        return 70;
      case SnapshotLimit.allPosts:
        return 50;
      case SnapshotLimit.myAllBookmarks:
        return 50;
      case SnapshotLimit.myAllPosts:
        return 50;
      case SnapshotLimit.allTalkRoom:
        return 30;
      case SnapshotLimit.allTalkHistory:
        return 50;
      case SnapshotLimit.userList:
        return 100;
    }
  }
}
