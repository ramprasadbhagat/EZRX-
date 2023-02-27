import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'combo_deal_sku_tier_dto.freezed.dart';
part 'combo_deal_sku_tier_dto.g.dart';

@freezed
class ComboDealSKUTierDto with _$ComboDealSKUTierDto {
  const ComboDealSKUTierDto._();
  @HiveType(typeId: 28, adapterName: 'ComboDealSKUTierDtoAdapter')
  const factory ComboDealSKUTierDto({
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
  }) = _ComboDealSKUTierDto;

  factory ComboDealSKUTierDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealSKUTierDtoFromJson(json);

  ComboDealSKUTier get toDomain => ComboDealSKUTier(
        rate: rate,
        conditionNumber: conditionNumber,
        minQty: minQty,
        type: type,
      );

  factory ComboDealSKUTierDto.fromDomain(ComboDealSKUTier domain) =>
      ComboDealSKUTierDto(
        rate: domain.rate,
        conditionNumber: domain.conditionNumber,
        minQty: domain.minQty,
        type: domain.type,
      );
}
