// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_history_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAllTalkHistoryControllerHash() =>
    r'fd094943320fb7c8f6fcc12b05de0ca51a822695';

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

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllTalkHistoryController].
@ProviderFor(watchAllTalkHistoryController)
const watchAllTalkHistoryControllerProvider =
    WatchAllTalkHistoryControllerFamily();

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllTalkHistoryController].
class WatchAllTalkHistoryControllerFamily
    extends Family<AsyncValue<List<TalkHistory>>> {
  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllTalkHistoryController].
  const WatchAllTalkHistoryControllerFamily();

  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllTalkHistoryController].
  WatchAllTalkHistoryControllerProvider call(String talkRoomId) {
    return WatchAllTalkHistoryControllerProvider(talkRoomId);
  }

  @override
  WatchAllTalkHistoryControllerProvider getProviderOverride(
    covariant WatchAllTalkHistoryControllerProvider provider,
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
  String? get name => r'watchAllTalkHistoryControllerProvider';
}

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllTalkHistoryController].
class WatchAllTalkHistoryControllerProvider
    extends AutoDisposeStreamProvider<List<TalkHistory>> {
  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllTalkHistoryController].
  WatchAllTalkHistoryControllerProvider(String talkRoomId)
    : this._internal(
        (ref) => watchAllTalkHistoryController(
          ref as WatchAllTalkHistoryControllerRef,
          talkRoomId,
        ),
        from: watchAllTalkHistoryControllerProvider,
        name: r'watchAllTalkHistoryControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllTalkHistoryControllerHash,
        dependencies: WatchAllTalkHistoryControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAllTalkHistoryControllerFamily._allTransitiveDependencies,
        talkRoomId: talkRoomId,
      );

  WatchAllTalkHistoryControllerProvider._internal(
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
    Stream<List<TalkHistory>> Function(
      WatchAllTalkHistoryControllerRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllTalkHistoryControllerProvider._internal(
        (ref) => create(ref as WatchAllTalkHistoryControllerRef),
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
  AutoDisposeStreamProviderElement<List<TalkHistory>> createElement() {
    return _WatchAllTalkHistoryControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllTalkHistoryControllerProvider &&
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
mixin WatchAllTalkHistoryControllerRef
    on AutoDisposeStreamProviderRef<List<TalkHistory>> {
  /// The parameter `talkRoomId` of this provider.
  String get talkRoomId;
}

class _WatchAllTalkHistoryControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<TalkHistory>>
    with WatchAllTalkHistoryControllerRef {
  _WatchAllTalkHistoryControllerProviderElement(super.provider);

  @override
  String get talkRoomId =>
      (origin as WatchAllTalkHistoryControllerProvider).talkRoomId;
}

String _$talkHistoryControllerHash() =>
    r'02556721182a3bfa328951c4540fef0b82e42c96';

/// See also [TalkHistoryController].
@ProviderFor(TalkHistoryController)
final talkHistoryControllerProvider =
    AutoDisposeNotifierProvider<TalkHistoryController, AsyncValue>.internal(
      TalkHistoryController.new,
      name: r'talkHistoryControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$talkHistoryControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TalkHistoryController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
