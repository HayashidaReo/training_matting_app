import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:matching_app/feature/user/model/userdata.dart';
import 'package:matching_app/feature/user/repo/user_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> updateUserProfile(
    UserData myUserData,
    String newUserName,
    newProfile,
  ) async {
    state = const AsyncLoading();
    final updateUserData = myUserData.copyWith(
      userName: newUserName,
      profile: newProfile,
    );
    await ref.read(userRepoProvider.notifier).updateUser(updateUserData);
    state = const AsyncData(null);
  }

  Future<void> updateUserIcon(UserData myUserData, String downloadUrl) async {
    state = const AsyncLoading();
    final updateUserData = myUserData.copyWith(iconImageUrl: downloadUrl);
    await ref.read(userRepoProvider.notifier).updateUser(updateUserData);
    state = const AsyncData(null);
  }

  Future<void> createUser({
    required String username,
    required String birthDate,
    required List<bool> genderList,
  }) async {
    state = const AsyncLoading();
    final gender = genderList[0] ? "男性" : "女性";
    UserData addUserData = UserData(
      userId: ref.read(currentUserControllerProvider)!.uid,
      userName: username,
      birthDate: birthDate,
      gender: gender,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      profile: '',
      iconImageUrl: '',
    );

    await ref.read(userRepoProvider.notifier).createUser(addUserData);
    state = const AsyncData(null);
  }

  Future<void> deleteUser(String deleteUserId) async {
    state = const AsyncLoading();
    await ref.read(userRepoProvider.notifier).deleteUser(deleteUserId);
    state = const AsyncData(null);
  }

  Future<UserData?> getMyUserData() async {
    state = const AsyncLoading();
    final String userId = ref.read(currentUserControllerProvider)!.uid;
    final UserData? userData = await ref
        .read(userRepoProvider.notifier)
        .getUser(userId);
    state = const AsyncData(null);
    return userData;
  }
}

@riverpod
Stream<UserData?> watchUserDataController(ref, String userId) {
  return ref.watch(userRepoProvider.notifier).watchUser(userId);
}

// 自分のユーザー情報を監視
@riverpod
Stream<UserData?> watchMyUserDataController(ref) {
  return ref
      .watch(userRepoProvider.notifier)
      .watchUser(ref.read(authRepoProvider)!.uid);
}

@riverpod
// streamでuserListを取得
Stream<List<UserData>> watchAllUsersController(ref) {
  return ref.watch(userRepoProvider.notifier).watchAllUsers();
}

@riverpod
// streamで指定した文字列と前方一致のuserのuserListを取得
Stream<List<UserData>> watchForwardMatchingWithQueryTextUsersController(
  ref,
  String queryText,
  String? myGender,
) {
  if (queryText.isEmpty) {
    if (myGender != null) {
      return ref
          .watch(userRepoProvider.notifier)
          .watchOppositeGenderUsers(myGender);
    } else {
      return ref.watch(userRepoProvider.notifier).watchAllUsers();
    }
  } else {
    if (myGender != null) {
      return ref
          .watch(userRepoProvider.notifier)
          .watchForwardMatchingWithQueryTextAndGenderUsers(queryText, myGender);
    } else {
      return ref
          .watch(userRepoProvider.notifier)
          .watchForwardMatchingWithQueryTextUsers(queryText);
    }
  }
}
