import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_info.freezed.dart';

@freezed
class DiscountInfo with _$DiscountInfo {
  const DiscountInfo._();

  const factory DiscountInfo({
    required DiscountType type,
    required int minQty,
    required double rate,
  }) = _DiscountInfo;

  factory DiscountInfo.empty() => DiscountInfo(
        type: DiscountType(''),
        minQty: 0,
        rate: 0,
      );

  String get text => type.isPercent
      ? '$rate ${type.getOrDefaultValue('')}'
      : '${type.getOrDefaultValue('')} $rate';
}
