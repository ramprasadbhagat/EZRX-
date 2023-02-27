import 'package:ezrxmobile/domain/order/entities/combo_deal_amount_tier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'combo_deal_amount_tier_dto.freezed.dart';
part 'combo_deal_amount_tier_dto.g.dart';

@freezed
class ComboDealAmountTierDto with _$ComboDealAmountTierDto {
  const ComboDealAmountTierDto._();
  @HiveType(typeId: 30, adapterName: 'ComboDealAmountTierDtoAdapter')
  const factory ComboDealAmountTierDto({
    @JsonKey(name: 'rate', defaultValue: '')
    @HiveField(0, defaultValue: '')
        required String rate,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
    @HiveField(1, defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'minTotalAmount', defaultValue: '')
    @HiveField(2, defaultValue: '')
        required String minTotalAmount,
    @JsonKey(name: 'minTotalCurrency', defaultValue: '')
    @HiveField(3, defaultValue: '')
        required String minTotalCurrency,
    @JsonKey(name: 'maxTotalAmount', defaultValue: '')
    @HiveField(4, defaultValue: '')
        required String maxTotalAmount,
    @JsonKey(name: 'maxTotalCurrency', defaultValue: '')
    @HiveField(5, defaultValue: '')
        required String maxTotalCurrency,
    @JsonKey(name: 'type', defaultValue: '')
    @HiveField(6, defaultValue: '')
        required String type,
  }) = _ComboDealAmountTierDto;

  factory ComboDealAmountTierDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealAmountTierDtoFromJson(json);

  ComboDealAmountTier get toDomain => ComboDealAmountTier(
        rate: rate,
        conditionNumber: conditionNumber,
        minTotalAmount: minTotalAmount,
        minTotalCurrency: minTotalCurrency,
        maxTotalAmount: maxTotalAmount,
        maxTotalCurrency: maxTotalCurrency,
        type: type,
      );

  factory ComboDealAmountTierDto.fromDomain(ComboDealAmountTier domain) =>
      ComboDealAmountTierDto(
        rate: domain.rate,
        conditionNumber: domain.conditionNumber,
        type: domain.type,
        maxTotalAmount: domain.maxTotalAmount,
        maxTotalCurrency: domain.maxTotalCurrency,
        minTotalAmount: domain.minTotalAmount,
        minTotalCurrency: domain.minTotalCurrency,
      );
}
