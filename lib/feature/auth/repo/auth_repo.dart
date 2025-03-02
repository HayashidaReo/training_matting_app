import 'package:firebase_auth/firebase_auth.dart';
import 'package:matching_app/config/firebase/firebase_auth_error_text.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo.g.dart';

@riverpod
class AuthRepo extends _$AuthRepo {
  @override
  User? build() {
    return ref.read(firebaseAuthInstanceProvider).currentUser;
  }

  //ログイン処理
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .signInWithCredential(
            EmailAuthProvider.credential(email: email, password: password),
          );
      state = ref.read(firebaseAuthInstanceProvider).currentUser;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  //ログアウト処理
  Future<void> signOut() async {
    await ref.read(firebaseAuthInstanceProvider).signOut();
    state = ref.read(firebaseAuthInstanceProvider).currentUser;
  }

  //新規登録処理
  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      state = ref.read(firebaseAuthInstanceProvider).currentUser;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  // Authの状態を監視する
  Stream<User?> authStateChange() {
    return ref.watch(firebaseAuthInstanceProvider).authStateChanges().map((
      User? currentUser,
    ) {
      state = currentUser;
      return state;
    });
  }

  //パスワードリマインダーメールの送信
  Future<String> sendPasswordResetEmail() async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .sendPasswordResetEmail(email: state!.email!);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  //メールアドレスの変更
  Future<String> updateEmail({
    required String password,
    required String newEmail,
  }) async {
    try {
      // 一度ログインしてもらう
      await signIn(email: state!.email!, password: password);

      // メールアドレスの変更を送信
      await state!.verifyBeforeUpdateEmail(newEmail);
      // ログアウト
      await signOut();
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }
}
