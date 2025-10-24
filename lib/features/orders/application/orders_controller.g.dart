// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myOrders)
const myOrdersProvider = MyOrdersProvider._();

final class MyOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Order>>,
          List<Order>,
          FutureOr<List<Order>>
        >
    with $FutureModifier<List<Order>>, $FutureProvider<List<Order>> {
  const MyOrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myOrdersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myOrdersHash();

  @$internal
  @override
  $FutureProviderElement<List<Order>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Order>> create(Ref ref) {
    return myOrders(ref);
  }
}

String _$myOrdersHash() => r'c056b018825419347ad2120f8e98c05f40ff47a4';
