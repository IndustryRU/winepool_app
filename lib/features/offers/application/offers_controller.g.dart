// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OffersController)
const offersControllerProvider = OffersControllerProvider._();

final class OffersControllerProvider
    extends $AsyncNotifierProvider<OffersController, List<Offer>> {
  const OffersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'offersControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$offersControllerHash();

  @$internal
  @override
  OffersController create() => OffersController();
}

String _$offersControllerHash() => r'373f8363aeb154c9051a5e20f9d17be642b0c112';

abstract class _$OffersController extends $AsyncNotifier<List<Offer>> {
  FutureOr<List<Offer>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Offer>>, List<Offer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Offer>>, List<Offer>>,
              AsyncValue<List<Offer>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
