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


# talk構造
talksのDB設計

key: talkRoomId
talkRoomId: userId1_userId2
userIds: [userId1, userId2]
createdAt
updatedAt
talkHistory/ talkId{
talkId: 自動生成
timeStamp: 
talker: userId
message: 
imageUrl:
},

roomの作成方法
相互フォローをトリガーに自動作成。

roomの削除方法
相互フォロー解除をトリガーに自動削除。

roomの特定方法
話したい相手と自分のIdを用意して、userIdsに２つとも含まれているroomを探す

トークの送信方法
talkHistoryに自動生成のkeyを作成してmapで保存

トークの表示方法
listTileで表示させて、
・timeStampでソート
・talker = myUserIdなら右側、違うなら左側にメッセージを配置する
・もしimageUrl != '' ならメッセージを表示した後に画像も表示する
