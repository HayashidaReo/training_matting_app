# 案1
users/uid/follows/{
key: targetUserId
targetUserId
myUserId
isFollowing
isFollowed
createdAt
apdatedAt

フォローした時：
1. 自分のfollows/targetUserIdのisFollowing = true にする
2. 相手のfollows/myUserIdのisFollowed = true にする

フォロー外した時：
1. 自分のfollows/targetUserIdのisFollowing = false にする
2. 相手のfollows/myUserIdのisFollowed = false にする

フォローしている一覧の取得方法
自分のfollows内のisFollowing = trueのフィールドのみを取得する

フォローされている一覧の取得方法
自分のfollows内のisFollowed = trueのフィールドのみを取得する

相互フォローの一覧取得方法
自分のfollows内のisFollowing = true かつ isFollowed = true のフィールドのみを取得する

相手から片想いされている一覧を取得する方法
自分のfollows内のisFollowing = false かつ isFollowed = true のフィールドのみを取得する

自分が相手をフォローしているか確認する方法
自分のfollows/targetUserId の isFollowing = trueかを確認する

もし、フィールドがなければ作成してからデータを追加する。
もし、両方フォローしていない状態になったらフィールドを削除する。


# 案2
user1UserId
user2UserId
isFollow1To2
isFollow2To1

フォローした時：
もし相手が自分をフォローしていなかったら、
user1UserId: myUserId
user2UserId: targetUserId
isFollow1To2: true
isFollow2To1: false

