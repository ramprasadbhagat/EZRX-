import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'apl_get_total_price_dto.freezed.dart';
part 'apl_get_total_price_dto.g.dart';

@freezed
class AplGetTotalPriceDto with _$AplGetTotalPriceDto {
  const AplGetTotalPriceDto._();
  const factory AplGetTotalPriceDto({
    @JsonKey(
      name: 'TotalPrice',
      defaultValue: 0,
    )
        required int grandTotal,
    @JsonKey(
      name: 'Tax',
      defaultValue: 0,
    )
        required int tax,
    @JsonKey(
      name: 'DeliveryFee',
      defaultValue: 0,
    )
        required int deliveryFee,
  }) = _AplGetTotalPriceDto;

  AplSimulatorOrder get toDomain => AplSimulatorOrder.empty().copyWith(
        grandTotal: double.tryParse(grandTotal.toString()) ?? 0,
        totalTax: double.tryParse(tax.toString()) ?? 0,
        smallOrderFee: double.tryParse(deliveryFee.toString()) ?? 0,
      );

  factory AplGetTotalPriceDto.fromJson(Map<String, dynamic> json) =>
      _$AplGetTotalPriceDtoFromJson(json);
}
