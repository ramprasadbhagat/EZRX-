import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_price.dart';

part 'return_price_dto.freezed.dart';
part 'return_price_dto.g.dart';

@freezed
class ReturnPriceDto with _$ReturnPriceDto {
  const ReturnPriceDto._();

  const factory ReturnPriceDto({
    @JsonKey(name: 'unitPrice', defaultValue: 0.0)
        required double unitPrice,
    @JsonKey(
      name: 'totalPrice',
      defaultValue: 0.0,
    )
        required double totalPrice,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(
      name: 'itemNumber',
      defaultValue: '',
    )
        required String itemNumber,
  }) = _ReturnPriceDto;

  ReturnPrice toDomain() {
    return ReturnPrice(
      itemNumber: itemNumber,
      materialNumber: MaterialNumber(materialNumber),
      totalPrice: MaterialPrice(totalPrice),
      unitPrice: MaterialPrice(unitPrice),
    );
  }

  factory ReturnPriceDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnPriceDtoFromJson(json);
}
