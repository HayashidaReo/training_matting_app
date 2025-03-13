/// 画像をアップロードするときの画質
enum ImageQuality { icon, post, talk }

extension FollowStatusExtention on ImageQuality {
  int get quality {
    switch (this) {
      case ImageQuality.icon:
        return 20;
      case ImageQuality.post:
        return 40;
      case ImageQuality.talk:
        return 40;
    }
  }
}
