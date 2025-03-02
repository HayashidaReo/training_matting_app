import 'package:firebase_auth/firebase_auth.dart';
import 'package:matching_app/feature/auth/repo/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_controller.g.dart';

@riverpod
class CurrentUserController extends _$CurrentUserController {
  @override
  User? build() {
    return ref.watch(authRepoProvider);
  }
}
