// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchWhetherIFollowTargetUserHash() =>
    r'fb46a76f9550c11aee589b36ef63df4ab9dc9ce9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 自分が対象ユーザーをフォローしているかをチェックする
///
/// Copied from [watchWhetherIFollowTargetUser].
@ProviderFor(watchWhetherIFollowTargetUser)
const watchWhetherIFollowTargetUserProvider =
    WatchWhetherIFollowTargetUserFamily();

/// 自分が対象ユーザーをフォローしているかをチェックする
///
/// Copied from [watchWhetherIFollowTargetUser].
class WatchWhetherIFollowTargetUserFamily extends Family<AsyncValue<bool>> {
  /// 自分が対象ユーザーをフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherIFollowTargetUser].
  const WatchWhetherIFollowTargetUserFamily();

  /// 自分が対象ユーザーをフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherIFollowTargetUser].
  WatchWhetherIFollowTargetUserProvider call(String targetUserId) {
    return WatchWhetherIFollowTargetUserProvider(targetUserId);
  }

  @override
  WatchWhetherIFollowTargetUserProvider getProviderOverride(
    covariant WatchWhetherIFollowTargetUserProvider provider,
  ) {
    return call(provider.targetUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchWhetherIFollowTargetUserProvider';
}

/// 自分が対象ユーザーをフォローしているかをチェックする
///
/// Copied from [watchWhetherIFollowTargetUser].
class WatchWhetherIFollowTargetUserProvider
    extends AutoDisposeStreamProvider<bool> {
  /// 自分が対象ユーザーをフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherIFollowTargetUser].
  WatchWhetherIFollowTargetUserProvider(String targetUserId)
    : this._internal(
        (ref) => watchWhetherIFollowTargetUser(
          ref as WatchWhetherIFollowTargetUserRef,
          targetUserId,
        ),
        from: watchWhetherIFollowTargetUserProvider,
        name: r'watchWhetherIFollowTargetUserProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchWhetherIFollowTargetUserHash,
        dependencies: WatchWhetherIFollowTargetUserFamily._dependencies,
        allTransitiveDependencies:
            WatchWhetherIFollowTargetUserFamily._allTransitiveDependencies,
        targetUserId: targetUserId,
      );

  WatchWhetherIFollowTargetUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetUserId,
  }) : super.internal();

  final String targetUserId;

  @override
  Override overrideWith(
    Stream<bool> Function(WatchWhetherIFollowTargetUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchWhetherIFollowTargetUserProvider._internal(
        (ref) => create(ref as WatchWhetherIFollowTargetUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetUserId: targetUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _WatchWhetherIFollowTargetUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchWhetherIFollowTargetUserProvider &&
        other.targetUserId == targetUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchWhetherIFollowTargetUserRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `targetUserId` of this provider.
  String get targetUserId;
}

class _WatchWhetherIFollowTargetUserProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with WatchWhetherIFollowTargetUserRef {
  _WatchWhetherIFollowTargetUserProviderElement(super.provider);

  @override
  String get targetUserId =>
      (origin as WatchWhetherIFollowTargetUserProvider).targetUserId;
}

String _$watchWhetherTargetUserFollowMeHash() =>
    r'9a69fbe3f18d75cf8836349b797093fa5b54bab2';

/// 対象ユーザーが自分をフォローしているかをチェックする
///
/// Copied from [watchWhetherTargetUserFollowMe].
@ProviderFor(watchWhetherTargetUserFollowMe)
const watchWhetherTargetUserFollowMeProvider =
    WatchWhetherTargetUserFollowMeFamily();

/// 対象ユーザーが自分をフォローしているかをチェックする
///
/// Copied from [watchWhetherTargetUserFollowMe].
class WatchWhetherTargetUserFollowMeFamily extends Family<AsyncValue<bool>> {
  /// 対象ユーザーが自分をフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherTargetUserFollowMe].
  const WatchWhetherTargetUserFollowMeFamily();

  /// 対象ユーザーが自分をフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherTargetUserFollowMe].
  WatchWhetherTargetUserFollowMeProvider call(String targetUserId) {
    return WatchWhetherTargetUserFollowMeProvider(targetUserId);
  }

  @override
  WatchWhetherTargetUserFollowMeProvider getProviderOverride(
    covariant WatchWhetherTargetUserFollowMeProvider provider,
  ) {
    return call(provider.targetUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchWhetherTargetUserFollowMeProvider';
}

/// 対象ユーザーが自分をフォローしているかをチェックする
///
/// Copied from [watchWhetherTargetUserFollowMe].
class WatchWhetherTargetUserFollowMeProvider
    extends AutoDisposeStreamProvider<bool> {
  /// 対象ユーザーが自分をフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherTargetUserFollowMe].
  WatchWhetherTargetUserFollowMeProvider(String targetUserId)
    : this._internal(
        (ref) => watchWhetherTargetUserFollowMe(
          ref as WatchWhetherTargetUserFollowMeRef,
          targetUserId,
        ),
        from: watchWhetherTargetUserFollowMeProvider,
        name: r'watchWhetherTargetUserFollowMeProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchWhetherTargetUserFollowMeHash,
        dependencies: WatchWhetherTargetUserFollowMeFamily._dependencies,
        allTransitiveDependencies:
            WatchWhetherTargetUserFollowMeFamily._allTransitiveDependencies,
        targetUserId: targetUserId,
      );

  WatchWhetherTargetUserFollowMeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetUserId,
  }) : super.internal();

  final String targetUserId;

  @override
  Override overrideWith(
    Stream<bool> Function(WatchWhetherTargetUserFollowMeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchWhetherTargetUserFollowMeProvider._internal(
        (ref) => create(ref as WatchWhetherTargetUserFollowMeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetUserId: targetUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _WatchWhetherTargetUserFollowMeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchWhetherTargetUserFollowMeProvider &&
        other.targetUserId == targetUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchWhetherTargetUserFollowMeRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `targetUserId` of this provider.
  String get targetUserId;
}

class _WatchWhetherTargetUserFollowMeProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with WatchWhetherTargetUserFollowMeRef {
  _WatchWhetherTargetUserFollowMeProviderElement(super.provider);

  @override
  String get targetUserId =>
      (origin as WatchWhetherTargetUserFollowMeProvider).targetUserId;
}

String _$watchAllMyFollowingUserListHash() =>
    r'90e384e16121ef27ffc025756b3b6184a7d5a2fd';

/// 自分がfollowしているユーザーを全て取得(follow)
///
/// Copied from [watchAllMyFollowingUserList].
@ProviderFor(watchAllMyFollowingUserList)
final watchAllMyFollowingUserListProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllMyFollowingUserList,
      name: r'watchAllMyFollowingUserListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllMyFollowingUserListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllMyFollowingUserListRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$watchAllFollowMeUserListHash() =>
    r'478ef5af3565b22c0df1b62bfe3537aac0c2ff81';

/// 自分をfollowしているユーザーを全て取得(follower)
///
/// Copied from [watchAllFollowMeUserList].
@ProviderFor(watchAllFollowMeUserList)
final watchAllFollowMeUserListProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllFollowMeUserList,
      name: r'watchAllFollowMeUserListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllFollowMeUserListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllFollowMeUserListRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$watchAllOnlyIncomingFollowUserListHash() =>
    r'7ba199da5628fd43cdc37ce2a900563eadb5abf2';

/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
///
/// Copied from [watchAllOnlyIncomingFollowUserList].
@ProviderFor(watchAllOnlyIncomingFollowUserList)
final watchAllOnlyIncomingFollowUserListProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllOnlyIncomingFollowUserList,
      name: r'watchAllOnlyIncomingFollowUserListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllOnlyIncomingFollowUserListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllOnlyIncomingFollowUserListRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$watchAllMutualFollowUserListHash() =>
    r'81a993a099480bf437c3575cddf459db2d1bdeb7';

/// 相互フォローしているユーザーを全て取得
///
/// Copied from [watchAllMutualFollowUserList].
@ProviderFor(watchAllMutualFollowUserList)
final watchAllMutualFollowUserListProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllMutualFollowUserList,
      name: r'watchAllMutualFollowUserListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllMutualFollowUserListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllMutualFollowUserListRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$followRepoHash() => r'62f5b22ff19ff9019006034332dd8ccd72de0790';

/// See also [FollowRepo].
@ProviderFor(FollowRepo)
final followRepoProvider =
    AutoDisposeNotifierProvider<FollowRepo, AsyncValue>.internal(
      FollowRepo.new,
      name: r'followRepoProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$followRepoHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FollowRepo = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
