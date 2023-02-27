import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'combo_deal_qty_tier_dto.freezed.dart';
part 'combo_deal_qty_tier_dto.g.dart';

@freezed
class ComboDealQtyTierDto with _$ComboDealQtyTierDto {
  const ComboDealQtyTierDto._();
  @HiveType(typeId: 29, adapterName: 'ComboDealQtyTierDtoAdapter')
  const factory ComboDealQtyTierDto({
    @JsonKey(name: 'rate', defaultValue: '')
    @HiveField(0, defaultValue: '')
        required String rate,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
    @HiveField(1, defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'minQty', defaultValue: '')
    @HiveField(2, defaultValue: '')
        required String minQty,
    @JsonKey(name: 'type', defaultValue: '')
    @HiveField(3, defaultValue: '')
        required String type,
  }) = _ComboDealQtyTierDto;

  factory ComboDealQtyTierDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealQtyTierDtoFromJson(json);

  ComboDealQtyTier get toDomain => ComboDealQtyTier(
        rate: rate,
        conditionNumber: conditionNumber,
        minQty: minQty,
        type: type,
      );

  factory ComboDealQtyTierDto.fromDomain(ComboDealQtyTier domain) =>
      ComboDealQtyTierDto(
        rate: domain.rate,
        conditionNumber: domain.conditionNumber,
        minQty: domain.minQty,
        type: domain.type,
      );
}
