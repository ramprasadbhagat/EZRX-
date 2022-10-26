import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bundle.freezed.dart';

@freezed
class PriceBundle with _$PriceBundle {
  const PriceBundle._();
  const factory PriceBundle({
    required String name,
    required String code,
    required List<PriceBundleItem> information,
  }) = _PriceBundle;

  factory PriceBundle.empty() => const PriceBundle(
        name: '',
        code: '',
        information: [],
      );
}

@freezed
class PriceBundleItem with _$PriceBundleItem {
  const PriceBundleItem._();
  const factory PriceBundleItem({
    required String type,
    required int sequence,
    required int quantity,
    required double rate,
  }) = _PriceBundleItem;

  factory PriceBundleItem.empty() => const PriceBundleItem(
        type: '',
        sequence: 0,
        quantity: 0,
        rate: 0,
      );
}
