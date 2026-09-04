// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appearanceRepositoryHash() =>
    r'3c8a94f73b863e15f0920c59d4444238fdf9fe28';

/// See also [appearanceRepository].
@ProviderFor(appearanceRepository)
final appearanceRepositoryProvider =
    AutoDisposeProvider<AppearanceRepository>.internal(
      appearanceRepository,
      name: r'appearanceRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appearanceRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppearanceRepositoryRef = AutoDisposeProviderRef<AppearanceRepository>;
String _$appearanceModeControllerHash() =>
    r'da8001b098b3b5b454828f87f713f03ab585bb6c';

/// The user's chosen appearance, read from and persisted to
/// [AppearanceRepository]. [build] resolves once from storage (typically
/// near-instant on-device, so the brief loading gap before it resolves is
/// not specially handled -- [NeptuneApp] falls back to [ThemeMode.system]
/// while this is loading, which is also the correct first-launch default).
///
/// Copied from [AppearanceModeController].
@ProviderFor(AppearanceModeController)
final appearanceModeControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      AppearanceModeController,
      ThemeMode
    >.internal(
      AppearanceModeController.new,
      name: r'appearanceModeControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appearanceModeControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppearanceModeController = AutoDisposeAsyncNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
