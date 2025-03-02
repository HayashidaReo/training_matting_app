import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    await ref.read(authRepoProvider.notifier).signOut();
    state = const AsyncData(null);
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final String result = await ref
        .read(authRepoProvider.notifier)
        .signIn(email: email, password: password);
    state = const AsyncData(null);
    return result;
  }

  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final String result = await ref
        .read(authRepoProvider.notifier)
        .createUser(email: email, password: password);
    state = const AsyncData(null);
    return result;
  }

  Future<String> updateEmail({
    required String password,
    required String newEmail,
  }) async {
    state = const AsyncLoading();
    final String result = await ref
        .read(authRepoProvider.notifier)
        .updateEmail(password: password, newEmail: newEmail);
    state = const AsyncData(null);
    return result;
  }

  Future<String> sendPasswordResetEmail() async {
    state = const AsyncLoading();
    final String result =
        await ref.read(authRepoProvider.notifier).sendPasswordResetEmail();
    state = const AsyncData(null);
    return result;
  }
}
