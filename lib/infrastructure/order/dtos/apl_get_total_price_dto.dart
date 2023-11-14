import 'package:freezed_annotation/freezed_annotation.dart';
part 'apl_get_total_price_dto.freezed.dart';
part 'apl_get_total_price_dto.g.dart';

@freezed
class AplGetTotalPriceDto with _$AplGetTotalPriceDto {
  const AplGetTotalPriceDto._();
  const factory AplGetTotalPriceDto({
    @JsonKey(name: 'TotalPrice', defaultValue: 0,) required int grandTotal,
  }) = _AplGetTotalPriceDto;

  double get getGrandTotalValue => double.parse(grandTotal.toString());

  factory AplGetTotalPriceDto.fromJson(Map<String, dynamic> json) =>
      _$AplGetTotalPriceDtoFromJson(json);
}
