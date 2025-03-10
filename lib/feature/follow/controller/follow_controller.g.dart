// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchWhetherIFollowTargetUserControllerHash() =>
    r'2cf4e9430ec6e4a0d0b20483e9513940952d28e3';

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
  WatchWhetherIFollowTargetUserControllerProvider call(String targetUserId) {
    return WatchWhetherIFollowTargetUserControllerProvider(targetUserId);
  }

  @override
  WatchWhetherIFollowTargetUserControllerProvider getProviderOverride(
    covariant WatchWhetherIFollowTargetUserControllerProvider provider,
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
  WatchWhetherIFollowTargetUserControllerProvider(String targetUserId)
    : this._internal(
        (ref) => watchWhetherIFollowTargetUserController(
          ref as WatchWhetherIFollowTargetUserControllerRef,
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
        targetUserId: targetUserId,
      );

  WatchWhetherIFollowTargetUserControllerProvider._internal(
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
mixin WatchWhetherIFollowTargetUserControllerRef
    on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `targetUserId` of this provider.
  String get targetUserId;
}

class _WatchWhetherIFollowTargetUserControllerProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with WatchWhetherIFollowTargetUserControllerRef {
  _WatchWhetherIFollowTargetUserControllerProviderElement(super.provider);

  @override
  String get targetUserId =>
      (origin as WatchWhetherIFollowTargetUserControllerProvider).targetUserId;
}

String _$watchWhetherTargetUserFollowMeControllerHash() =>
    r'e8ab64eb993ab4906a472faeffb5f8fe7a920611';

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
  WatchWhetherTargetUserFollowMeControllerProvider call(String targetUserId) {
    return WatchWhetherTargetUserFollowMeControllerProvider(targetUserId);
  }

  @override
  WatchWhetherTargetUserFollowMeControllerProvider getProviderOverride(
    covariant WatchWhetherTargetUserFollowMeControllerProvider provider,
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
  WatchWhetherTargetUserFollowMeControllerProvider(String targetUserId)
    : this._internal(
        (ref) => watchWhetherTargetUserFollowMeController(
          ref as WatchWhetherTargetUserFollowMeControllerRef,
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
        targetUserId: targetUserId,
      );

  WatchWhetherTargetUserFollowMeControllerProvider._internal(
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
mixin WatchWhetherTargetUserFollowMeControllerRef
    on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `targetUserId` of this provider.
  String get targetUserId;
}

class _WatchWhetherTargetUserFollowMeControllerProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with WatchWhetherTargetUserFollowMeControllerRef {
  _WatchWhetherTargetUserFollowMeControllerProviderElement(super.provider);

  @override
  String get targetUserId =>
      (origin as WatchWhetherTargetUserFollowMeControllerProvider).targetUserId;
}

String _$watchAllMyFollowingUserListControllerHash() =>
    r'057d9b451a7f91abb3e507e19a1209e2b1c6522b';

/// 自分がfollowしているユーザーを全て取得(follow)
///
/// Copied from [watchAllMyFollowingUserListController].
@ProviderFor(watchAllMyFollowingUserListController)
final watchAllMyFollowingUserListControllerProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllMyFollowingUserListController,
      name: r'watchAllMyFollowingUserListControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllMyFollowingUserListControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllMyFollowingUserListControllerRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$watchAllFollowMeUserListControllerHash() =>
    r'fff04a8efe5929f087a5b54c54728bf0c450de39';

/// 自分をfollowしているユーザーを全て取得(follower)
///
/// Copied from [watchAllFollowMeUserListController].
@ProviderFor(watchAllFollowMeUserListController)
final watchAllFollowMeUserListControllerProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllFollowMeUserListController,
      name: r'watchAllFollowMeUserListControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllFollowMeUserListControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllFollowMeUserListControllerRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$watchAllOnlyIncomingFollowUserListControllerHash() =>
    r'03a6e65b14d0394108d8f30e2c1276c5281a2fed';

/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
///
/// Copied from [watchAllOnlyIncomingFollowUserListController].
@ProviderFor(watchAllOnlyIncomingFollowUserListController)
final watchAllOnlyIncomingFollowUserListControllerProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllOnlyIncomingFollowUserListController,
      name: r'watchAllOnlyIncomingFollowUserListControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllOnlyIncomingFollowUserListControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllOnlyIncomingFollowUserListControllerRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$watchAllMutualFollowUserListControllerHash() =>
    r'd752dd84fcd50d3f768e465041083eda581d3c9d';

/// 相互フォローしているユーザーを全て取得
///
/// Copied from [watchAllMutualFollowUserListController].
@ProviderFor(watchAllMutualFollowUserListController)
final watchAllMutualFollowUserListControllerProvider =
    AutoDisposeStreamProvider<List<Follow>>.internal(
      watchAllMutualFollowUserListController,
      name: r'watchAllMutualFollowUserListControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllMutualFollowUserListControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllMutualFollowUserListControllerRef =
    AutoDisposeStreamProviderRef<List<Follow>>;
String _$followControllerHash() => r'2da9cccb5395ebd1365ebb2c9350c0166ecce3ce';

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
