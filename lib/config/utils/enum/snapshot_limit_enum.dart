/// 画像をアップロードするときの画質
enum SnapshotLimit {
  allMyFollowingUser,
  allFollowMeUser,
  allOnlyIncomingFollowUser,
  allMutualFollowUser,
}

extension FollowStatusExtention on SnapshotLimit {
  int get limit {
    switch (this) {
      case SnapshotLimit.allMyFollowingUser:
        return 50;
      case SnapshotLimit.allFollowMeUser:
        return 50;
      case SnapshotLimit.allOnlyIncomingFollowUser:
        return 50;
      case SnapshotLimit.allMutualFollowUser:
        return 70;
    }
  }
}
