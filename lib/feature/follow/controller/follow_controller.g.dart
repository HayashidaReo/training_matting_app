// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchWhetherIFollowTargetUserControllerHash() =>
    r'514f9f1f21fa4e6a2aee9d09ceaf8c80c99b0f3a';

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
/// Copied from [watchWhetherIFollowTargetUserController].
@ProviderFor(watchWhetherIFollowTargetUserController)
const watchWhetherIFollowTargetUserControllerProvider =
    WatchWhetherIFollowTargetUserControllerFamily();

/// 自分が対象ユーザーをフォローしているかをチェックする
///
/// Copied from [watchWhetherIFollowTargetUserController].
class WatchWhetherIFollowTargetUserControllerFamily
    extends Family<AsyncValue<bool>> {
  /// 自分が対象ユーザーをフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherIFollowTargetUserController].
  const WatchWhetherIFollowTargetUserControllerFamily();

  /// 自分が対象ユーザーをフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherIFollowTargetUserController].
  WatchWhetherIFollowTargetUserControllerProvider call(
    String myUserId,
    String targetUserId,
  ) {
    return WatchWhetherIFollowTargetUserControllerProvider(
      myUserId,
      targetUserId,
    );
  }

  @override
  WatchWhetherIFollowTargetUserControllerProvider getProviderOverride(
    covariant WatchWhetherIFollowTargetUserControllerProvider provider,
  ) {
    return call(provider.myUserId, provider.targetUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchWhetherIFollowTargetUserControllerProvider';
}

/// 自分が対象ユーザーをフォローしているかをチェックする
///
/// Copied from [watchWhetherIFollowTargetUserController].
class WatchWhetherIFollowTargetUserControllerProvider
    extends AutoDisposeStreamProvider<bool> {
  /// 自分が対象ユーザーをフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherIFollowTargetUserController].
  WatchWhetherIFollowTargetUserControllerProvider(
    String myUserId,
    String targetUserId,
  ) : this._internal(
        (ref) => watchWhetherIFollowTargetUserController(
          ref as WatchWhetherIFollowTargetUserControllerRef,
          myUserId,
          targetUserId,
        ),
        from: watchWhetherIFollowTargetUserControllerProvider,
        name: r'watchWhetherIFollowTargetUserControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchWhetherIFollowTargetUserControllerHash,
        dependencies:
            WatchWhetherIFollowTargetUserControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchWhetherIFollowTargetUserControllerFamily
                ._allTransitiveDependencies,
        myUserId: myUserId,
        targetUserId: targetUserId,
      );

  WatchWhetherIFollowTargetUserControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.myUserId,
    required this.targetUserId,
  }) : super.internal();

  final String myUserId;
  final String targetUserId;

  @override
  Override overrideWith(
    Stream<bool> Function(WatchWhetherIFollowTargetUserControllerRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchWhetherIFollowTargetUserControllerProvider._internal(
        (ref) => create(ref as WatchWhetherIFollowTargetUserControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        myUserId: myUserId,
        targetUserId: targetUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _WatchWhetherIFollowTargetUserControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchWhetherIFollowTargetUserControllerProvider &&
        other.myUserId == myUserId &&
        other.targetUserId == targetUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, myUserId.hashCode);
    hash = _SystemHash.combine(hash, targetUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchWhetherIFollowTargetUserControllerRef
    on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `myUserId` of this provider.
  String get myUserId;

  /// The parameter `targetUserId` of this provider.
  String get targetUserId;
}

class _WatchWhetherIFollowTargetUserControllerProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with WatchWhetherIFollowTargetUserControllerRef {
  _WatchWhetherIFollowTargetUserControllerProviderElement(super.provider);

  @override
  String get myUserId =>
      (origin as WatchWhetherIFollowTargetUserControllerProvider).myUserId;
  @override
  String get targetUserId =>
      (origin as WatchWhetherIFollowTargetUserControllerProvider).targetUserId;
}

String _$watchWhetherTargetUserFollowMeControllerHash() =>
    r'f001c63758dfa22c471488cb54a870470e26440c';

/// 対象ユーザーが自分をフォローしているかをチェックする
///
/// Copied from [watchWhetherTargetUserFollowMeController].
@ProviderFor(watchWhetherTargetUserFollowMeController)
const watchWhetherTargetUserFollowMeControllerProvider =
    WatchWhetherTargetUserFollowMeControllerFamily();

/// 対象ユーザーが自分をフォローしているかをチェックする
///
/// Copied from [watchWhetherTargetUserFollowMeController].
class WatchWhetherTargetUserFollowMeControllerFamily
    extends Family<AsyncValue<bool>> {
  /// 対象ユーザーが自分をフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherTargetUserFollowMeController].
  const WatchWhetherTargetUserFollowMeControllerFamily();

  /// 対象ユーザーが自分をフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherTargetUserFollowMeController].
  WatchWhetherTargetUserFollowMeControllerProvider call(
    String myUserId,
    String targetUserId,
  ) {
    return WatchWhetherTargetUserFollowMeControllerProvider(
      myUserId,
      targetUserId,
    );
  }

  @override
  WatchWhetherTargetUserFollowMeControllerProvider getProviderOverride(
    covariant WatchWhetherTargetUserFollowMeControllerProvider provider,
  ) {
    return call(provider.myUserId, provider.targetUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchWhetherTargetUserFollowMeControllerProvider';
}

/// 対象ユーザーが自分をフォローしているかをチェックする
///
/// Copied from [watchWhetherTargetUserFollowMeController].
class WatchWhetherTargetUserFollowMeControllerProvider
    extends AutoDisposeStreamProvider<bool> {
  /// 対象ユーザーが自分をフォローしているかをチェックする
  ///
  /// Copied from [watchWhetherTargetUserFollowMeController].
  WatchWhetherTargetUserFollowMeControllerProvider(
    String myUserId,
    String targetUserId,
  ) : this._internal(
        (ref) => watchWhetherTargetUserFollowMeController(
          ref as WatchWhetherTargetUserFollowMeControllerRef,
          myUserId,
          targetUserId,
        ),
        from: watchWhetherTargetUserFollowMeControllerProvider,
        name: r'watchWhetherTargetUserFollowMeControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchWhetherTargetUserFollowMeControllerHash,
        dependencies:
            WatchWhetherTargetUserFollowMeControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchWhetherTargetUserFollowMeControllerFamily
                ._allTransitiveDependencies,
        myUserId: myUserId,
        targetUserId: targetUserId,
      );

  WatchWhetherTargetUserFollowMeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.myUserId,
    required this.targetUserId,
  }) : super.internal();

  final String myUserId;
  final String targetUserId;

  @override
  Override overrideWith(
    Stream<bool> Function(WatchWhetherTargetUserFollowMeControllerRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchWhetherTargetUserFollowMeControllerProvider._internal(
        (ref) => create(ref as WatchWhetherTargetUserFollowMeControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        myUserId: myUserId,
        targetUserId: targetUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _WatchWhetherTargetUserFollowMeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchWhetherTargetUserFollowMeControllerProvider &&
        other.myUserId == myUserId &&
        other.targetUserId == targetUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, myUserId.hashCode);
    hash = _SystemHash.combine(hash, targetUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchWhetherTargetUserFollowMeControllerRef
    on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `myUserId` of this provider.
  String get myUserId;

  /// The parameter `targetUserId` of this provider.
  String get targetUserId;
}

class _WatchWhetherTargetUserFollowMeControllerProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with WatchWhetherTargetUserFollowMeControllerRef {
  _WatchWhetherTargetUserFollowMeControllerProviderElement(super.provider);

  @override
  String get myUserId =>
      (origin as WatchWhetherTargetUserFollowMeControllerProvider).myUserId;
  @override
  String get targetUserId =>
      (origin as WatchWhetherTargetUserFollowMeControllerProvider).targetUserId;
}

String _$watchAllMyFollowingUserListControllerHash() =>
    r'70b0dc9d783247894f3ecf93a32eee2658806c8f';

/// 自分がfollowしているユーザーを全て取得(follow)
///
/// Copied from [watchAllMyFollowingUserListController].
@ProviderFor(watchAllMyFollowingUserListController)
const watchAllMyFollowingUserListControllerProvider =
    WatchAllMyFollowingUserListControllerFamily();

/// 自分がfollowしているユーザーを全て取得(follow)
///
/// Copied from [watchAllMyFollowingUserListController].
class WatchAllMyFollowingUserListControllerFamily
    extends Family<AsyncValue<List<Follow>>> {
  /// 自分がfollowしているユーザーを全て取得(follow)
  ///
  /// Copied from [watchAllMyFollowingUserListController].
  const WatchAllMyFollowingUserListControllerFamily();

  /// 自分がfollowしているユーザーを全て取得(follow)
  ///
  /// Copied from [watchAllMyFollowingUserListController].
  WatchAllMyFollowingUserListControllerProvider call(String myUserId) {
    return WatchAllMyFollowingUserListControllerProvider(myUserId);
  }

  @override
  WatchAllMyFollowingUserListControllerProvider getProviderOverride(
    covariant WatchAllMyFollowingUserListControllerProvider provider,
  ) {
    return call(provider.myUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchAllMyFollowingUserListControllerProvider';
}

/// 自分がfollowしているユーザーを全て取得(follow)
///
/// Copied from [watchAllMyFollowingUserListController].
class WatchAllMyFollowingUserListControllerProvider
    extends AutoDisposeStreamProvider<List<Follow>> {
  /// 自分がfollowしているユーザーを全て取得(follow)
  ///
  /// Copied from [watchAllMyFollowingUserListController].
  WatchAllMyFollowingUserListControllerProvider(String myUserId)
    : this._internal(
        (ref) => watchAllMyFollowingUserListController(
          ref as WatchAllMyFollowingUserListControllerRef,
          myUserId,
        ),
        from: watchAllMyFollowingUserListControllerProvider,
        name: r'watchAllMyFollowingUserListControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllMyFollowingUserListControllerHash,
        dependencies: WatchAllMyFollowingUserListControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAllMyFollowingUserListControllerFamily
                ._allTransitiveDependencies,
        myUserId: myUserId,
      );

  WatchAllMyFollowingUserListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.myUserId,
  }) : super.internal();

  final String myUserId;

  @override
  Override overrideWith(
    Stream<List<Follow>> Function(
      WatchAllMyFollowingUserListControllerRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllMyFollowingUserListControllerProvider._internal(
        (ref) => create(ref as WatchAllMyFollowingUserListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        myUserId: myUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Follow>> createElement() {
    return _WatchAllMyFollowingUserListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllMyFollowingUserListControllerProvider &&
        other.myUserId == myUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, myUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAllMyFollowingUserListControllerRef
    on AutoDisposeStreamProviderRef<List<Follow>> {
  /// The parameter `myUserId` of this provider.
  String get myUserId;
}

class _WatchAllMyFollowingUserListControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Follow>>
    with WatchAllMyFollowingUserListControllerRef {
  _WatchAllMyFollowingUserListControllerProviderElement(super.provider);

  @override
  String get myUserId =>
      (origin as WatchAllMyFollowingUserListControllerProvider).myUserId;
}

String _$watchAllFollowMeUserListControllerHash() =>
    r'06e16740b51c86c0575bbea12d716317172c934f';

/// 自分をfollowしているユーザーを全て取得(follower)
///
/// Copied from [watchAllFollowMeUserListController].
@ProviderFor(watchAllFollowMeUserListController)
const watchAllFollowMeUserListControllerProvider =
    WatchAllFollowMeUserListControllerFamily();

/// 自分をfollowしているユーザーを全て取得(follower)
///
/// Copied from [watchAllFollowMeUserListController].
class WatchAllFollowMeUserListControllerFamily
    extends Family<AsyncValue<List<Follow>>> {
  /// 自分をfollowしているユーザーを全て取得(follower)
  ///
  /// Copied from [watchAllFollowMeUserListController].
  const WatchAllFollowMeUserListControllerFamily();

  /// 自分をfollowしているユーザーを全て取得(follower)
  ///
  /// Copied from [watchAllFollowMeUserListController].
  WatchAllFollowMeUserListControllerProvider call(String myUserId) {
    return WatchAllFollowMeUserListControllerProvider(myUserId);
  }

  @override
  WatchAllFollowMeUserListControllerProvider getProviderOverride(
    covariant WatchAllFollowMeUserListControllerProvider provider,
  ) {
    return call(provider.myUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchAllFollowMeUserListControllerProvider';
}

/// 自分をfollowしているユーザーを全て取得(follower)
///
/// Copied from [watchAllFollowMeUserListController].
class WatchAllFollowMeUserListControllerProvider
    extends AutoDisposeStreamProvider<List<Follow>> {
  /// 自分をfollowしているユーザーを全て取得(follower)
  ///
  /// Copied from [watchAllFollowMeUserListController].
  WatchAllFollowMeUserListControllerProvider(String myUserId)
    : this._internal(
        (ref) => watchAllFollowMeUserListController(
          ref as WatchAllFollowMeUserListControllerRef,
          myUserId,
        ),
        from: watchAllFollowMeUserListControllerProvider,
        name: r'watchAllFollowMeUserListControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllFollowMeUserListControllerHash,
        dependencies: WatchAllFollowMeUserListControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAllFollowMeUserListControllerFamily._allTransitiveDependencies,
        myUserId: myUserId,
      );

  WatchAllFollowMeUserListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.myUserId,
  }) : super.internal();

  final String myUserId;

  @override
  Override overrideWith(
    Stream<List<Follow>> Function(
      WatchAllFollowMeUserListControllerRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllFollowMeUserListControllerProvider._internal(
        (ref) => create(ref as WatchAllFollowMeUserListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        myUserId: myUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Follow>> createElement() {
    return _WatchAllFollowMeUserListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllFollowMeUserListControllerProvider &&
        other.myUserId == myUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, myUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAllFollowMeUserListControllerRef
    on AutoDisposeStreamProviderRef<List<Follow>> {
  /// The parameter `myUserId` of this provider.
  String get myUserId;
}

class _WatchAllFollowMeUserListControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Follow>>
    with WatchAllFollowMeUserListControllerRef {
  _WatchAllFollowMeUserListControllerProviderElement(super.provider);

  @override
  String get myUserId =>
      (origin as WatchAllFollowMeUserListControllerProvider).myUserId;
}

String _$watchAllOnlyIncomingFollowUserListControllerHash() =>
    r'0f664a060ff7f46df8c16cbd842d5c3e421717a5';

/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
///
/// Copied from [watchAllOnlyIncomingFollowUserListController].
@ProviderFor(watchAllOnlyIncomingFollowUserListController)
const watchAllOnlyIncomingFollowUserListControllerProvider =
    WatchAllOnlyIncomingFollowUserListControllerFamily();

/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
///
/// Copied from [watchAllOnlyIncomingFollowUserListController].
class WatchAllOnlyIncomingFollowUserListControllerFamily
    extends Family<AsyncValue<List<Follow>>> {
  /// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
  ///
  /// Copied from [watchAllOnlyIncomingFollowUserListController].
  const WatchAllOnlyIncomingFollowUserListControllerFamily();

  /// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
  ///
  /// Copied from [watchAllOnlyIncomingFollowUserListController].
  WatchAllOnlyIncomingFollowUserListControllerProvider call(String myUserId) {
    return WatchAllOnlyIncomingFollowUserListControllerProvider(myUserId);
  }

  @override
  WatchAllOnlyIncomingFollowUserListControllerProvider getProviderOverride(
    covariant WatchAllOnlyIncomingFollowUserListControllerProvider provider,
  ) {
    return call(provider.myUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchAllOnlyIncomingFollowUserListControllerProvider';
}

/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
///
/// Copied from [watchAllOnlyIncomingFollowUserListController].
class WatchAllOnlyIncomingFollowUserListControllerProvider
    extends AutoDisposeStreamProvider<List<Follow>> {
  /// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
  ///
  /// Copied from [watchAllOnlyIncomingFollowUserListController].
  WatchAllOnlyIncomingFollowUserListControllerProvider(String myUserId)
    : this._internal(
        (ref) => watchAllOnlyIncomingFollowUserListController(
          ref as WatchAllOnlyIncomingFollowUserListControllerRef,
          myUserId,
        ),
        from: watchAllOnlyIncomingFollowUserListControllerProvider,
        name: r'watchAllOnlyIncomingFollowUserListControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllOnlyIncomingFollowUserListControllerHash,
        dependencies:
            WatchAllOnlyIncomingFollowUserListControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAllOnlyIncomingFollowUserListControllerFamily
                ._allTransitiveDependencies,
        myUserId: myUserId,
      );

  WatchAllOnlyIncomingFollowUserListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.myUserId,
  }) : super.internal();

  final String myUserId;

  @override
  Override overrideWith(
    Stream<List<Follow>> Function(
      WatchAllOnlyIncomingFollowUserListControllerRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllOnlyIncomingFollowUserListControllerProvider._internal(
        (ref) => create(ref as WatchAllOnlyIncomingFollowUserListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        myUserId: myUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Follow>> createElement() {
    return _WatchAllOnlyIncomingFollowUserListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllOnlyIncomingFollowUserListControllerProvider &&
        other.myUserId == myUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, myUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAllOnlyIncomingFollowUserListControllerRef
    on AutoDisposeStreamProviderRef<List<Follow>> {
  /// The parameter `myUserId` of this provider.
  String get myUserId;
}

class _WatchAllOnlyIncomingFollowUserListControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Follow>>
    with WatchAllOnlyIncomingFollowUserListControllerRef {
  _WatchAllOnlyIncomingFollowUserListControllerProviderElement(super.provider);

  @override
  String get myUserId =>
      (origin as WatchAllOnlyIncomingFollowUserListControllerProvider).myUserId;
}

String _$watchAllMutualFollowUserListControllerHash() =>
    r'87f47cce16072a4d58db1284bc09640f91529486';

/// 相互フォローしているユーザーを全て取得
///
/// Copied from [watchAllMutualFollowUserListController].
@ProviderFor(watchAllMutualFollowUserListController)
const watchAllMutualFollowUserListControllerProvider =
    WatchAllMutualFollowUserListControllerFamily();

/// 相互フォローしているユーザーを全て取得
///
/// Copied from [watchAllMutualFollowUserListController].
class WatchAllMutualFollowUserListControllerFamily
    extends Family<AsyncValue<List<Follow>>> {
  /// 相互フォローしているユーザーを全て取得
  ///
  /// Copied from [watchAllMutualFollowUserListController].
  const WatchAllMutualFollowUserListControllerFamily();

  /// 相互フォローしているユーザーを全て取得
  ///
  /// Copied from [watchAllMutualFollowUserListController].
  WatchAllMutualFollowUserListControllerProvider call(String myUserId) {
    return WatchAllMutualFollowUserListControllerProvider(myUserId);
  }

  @override
  WatchAllMutualFollowUserListControllerProvider getProviderOverride(
    covariant WatchAllMutualFollowUserListControllerProvider provider,
  ) {
    return call(provider.myUserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchAllMutualFollowUserListControllerProvider';
}

/// 相互フォローしているユーザーを全て取得
///
/// Copied from [watchAllMutualFollowUserListController].
class WatchAllMutualFollowUserListControllerProvider
    extends AutoDisposeStreamProvider<List<Follow>> {
  /// 相互フォローしているユーザーを全て取得
  ///
  /// Copied from [watchAllMutualFollowUserListController].
  WatchAllMutualFollowUserListControllerProvider(String myUserId)
    : this._internal(
        (ref) => watchAllMutualFollowUserListController(
          ref as WatchAllMutualFollowUserListControllerRef,
          myUserId,
        ),
        from: watchAllMutualFollowUserListControllerProvider,
        name: r'watchAllMutualFollowUserListControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllMutualFollowUserListControllerHash,
        dependencies:
            WatchAllMutualFollowUserListControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAllMutualFollowUserListControllerFamily
                ._allTransitiveDependencies,
        myUserId: myUserId,
      );

  WatchAllMutualFollowUserListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.myUserId,
  }) : super.internal();

  final String myUserId;

  @override
  Override overrideWith(
    Stream<List<Follow>> Function(
      WatchAllMutualFollowUserListControllerRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllMutualFollowUserListControllerProvider._internal(
        (ref) => create(ref as WatchAllMutualFollowUserListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        myUserId: myUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Follow>> createElement() {
    return _WatchAllMutualFollowUserListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllMutualFollowUserListControllerProvider &&
        other.myUserId == myUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, myUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAllMutualFollowUserListControllerRef
    on AutoDisposeStreamProviderRef<List<Follow>> {
  /// The parameter `myUserId` of this provider.
  String get myUserId;
}

class _WatchAllMutualFollowUserListControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Follow>>
    with WatchAllMutualFollowUserListControllerRef {
  _WatchAllMutualFollowUserListControllerProviderElement(super.provider);

  @override
  String get myUserId =>
      (origin as WatchAllMutualFollowUserListControllerProvider).myUserId;
}

String _$followControllerHash() => r'85bd9554462b2d41f9b2a65a3c2c861c86f199a3';

/// See also [FollowController].
@ProviderFor(FollowController)
final followControllerProvider =
    AutoDisposeNotifierProvider<FollowController, AsyncValue>.internal(
      FollowController.new,
      name: r'followControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$followControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FollowController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
