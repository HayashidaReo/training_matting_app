// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAllTalkRoomListControllerHash() =>
    r'9976bafaa415ad4a18a1a0e1ab281b6d61b3c5ad';

/// トークルーム一覧を取得
///
/// Copied from [watchAllTalkRoomListController].
@ProviderFor(watchAllTalkRoomListController)
final watchAllTalkRoomListControllerProvider =
    AutoDisposeStreamProvider<List<Talk>>.internal(
      watchAllTalkRoomListController,
      name: r'watchAllTalkRoomListControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllTalkRoomListControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllTalkRoomListControllerRef =
    AutoDisposeStreamProviderRef<List<Talk>>;
String _$watchExistTalkRoomControllerHash() =>
    r'962d98561cc626c68044a2368f97703f75ff69f1';

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

/// 指定したトークルームの部屋があるかどうかを監視する
///
/// Copied from [watchExistTalkRoomController].
@ProviderFor(watchExistTalkRoomController)
const watchExistTalkRoomControllerProvider =
    WatchExistTalkRoomControllerFamily();

/// 指定したトークルームの部屋があるかどうかを監視する
///
/// Copied from [watchExistTalkRoomController].
class WatchExistTalkRoomControllerFamily extends Family<AsyncValue<bool>> {
  /// 指定したトークルームの部屋があるかどうかを監視する
  ///
  /// Copied from [watchExistTalkRoomController].
  const WatchExistTalkRoomControllerFamily();

  /// 指定したトークルームの部屋があるかどうかを監視する
  ///
  /// Copied from [watchExistTalkRoomController].
  WatchExistTalkRoomControllerProvider call(String talkRoomId) {
    return WatchExistTalkRoomControllerProvider(talkRoomId);
  }

  @override
  WatchExistTalkRoomControllerProvider getProviderOverride(
    covariant WatchExistTalkRoomControllerProvider provider,
  ) {
    return call(provider.talkRoomId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchExistTalkRoomControllerProvider';
}

/// 指定したトークルームの部屋があるかどうかを監視する
///
/// Copied from [watchExistTalkRoomController].
class WatchExistTalkRoomControllerProvider
    extends AutoDisposeStreamProvider<bool> {
  /// 指定したトークルームの部屋があるかどうかを監視する
  ///
  /// Copied from [watchExistTalkRoomController].
  WatchExistTalkRoomControllerProvider(String talkRoomId)
    : this._internal(
        (ref) => watchExistTalkRoomController(
          ref as WatchExistTalkRoomControllerRef,
          talkRoomId,
        ),
        from: watchExistTalkRoomControllerProvider,
        name: r'watchExistTalkRoomControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchExistTalkRoomControllerHash,
        dependencies: WatchExistTalkRoomControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchExistTalkRoomControllerFamily._allTransitiveDependencies,
        talkRoomId: talkRoomId,
      );

  WatchExistTalkRoomControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.talkRoomId,
  }) : super.internal();

  final String talkRoomId;

  @override
  Override overrideWith(
    Stream<bool> Function(WatchExistTalkRoomControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchExistTalkRoomControllerProvider._internal(
        (ref) => create(ref as WatchExistTalkRoomControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        talkRoomId: talkRoomId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _WatchExistTalkRoomControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchExistTalkRoomControllerProvider &&
        other.talkRoomId == talkRoomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, talkRoomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchExistTalkRoomControllerRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `talkRoomId` of this provider.
  String get talkRoomId;
}

class _WatchExistTalkRoomControllerProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with WatchExistTalkRoomControllerRef {
  _WatchExistTalkRoomControllerProviderElement(super.provider);

  @override
  String get talkRoomId =>
      (origin as WatchExistTalkRoomControllerProvider).talkRoomId;
}

String _$talkControllerHash() => r'32c02cd8aa394e568f25d44e940aa19aee25a101';

/// See also [TalkController].
@ProviderFor(TalkController)
final talkControllerProvider =
    AutoDisposeNotifierProvider<TalkController, AsyncValue>.internal(
      TalkController.new,
      name: r'talkControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$talkControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TalkController = AutoDisposeNotifier<AsyncValue>;
String _$allTalkRoomListLimitControllerHash() =>
    r'c3315294affad3a07c6cda4345a39bd3e60fcd9d';

/// See also [AllTalkRoomListLimitController].
@ProviderFor(AllTalkRoomListLimitController)
final allTalkRoomListLimitControllerProvider =
    AutoDisposeNotifierProvider<AllTalkRoomListLimitController, int>.internal(
      AllTalkRoomListLimitController.new,
      name: r'allTalkRoomListLimitControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$allTalkRoomListLimitControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AllTalkRoomListLimitController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
