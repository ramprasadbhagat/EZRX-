import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/overriden_rule_tier.dart';
import 'package:hive/hive.dart';

part 'overriden_rule_tier_dto.freezed.dart';
part 'overriden_rule_tier_dto.g.dart';

@freezed
class OverridenRuleTierDto with _$OverridenRuleTierDto {
  const OverridenRuleTierDto._();
  @HiveType(typeId: 35, adapterName: 'OverridenRuleTierDtoAdapter')
  const factory OverridenRuleTierDto({
    @JsonKey(name: 'Rate', defaultValue: 0)
    @HiveField(19, defaultValue: 0)
        required double rate,
    @JsonKey(name: 'Quantity', defaultValue: 0)
    @HiveField(20, defaultValue: 0)
        required double quantity,
    @JsonKey(name: 'Conditions', defaultValue: '')
    @HiveField(21, defaultValue: '')
        required String conditions,
    @JsonKey(name: 'Tier', defaultValue: '')
    @HiveField(22, defaultValue: '')
        required String tier,
    @JsonKey(name: 'Overrider', defaultValue: '')
    @HiveField(23, defaultValue: '')
        required String overrider,
}) = _OverridenRuleTierDto;

  OverridenRuleTier toDomain() => OverridenRuleTier(
    rate: rate,
    quantity: quantity,
    conditions: conditions,
    tier: tier,
    overrider: overrider,
  );

  factory OverridenRuleTierDto.fromDomain(OverridenRuleTier overridenRuleTier) {
    return OverridenRuleTierDto(
      rate: overridenRuleTier.rate,
      quantity: overridenRuleTier.quantity,
      conditions: overridenRuleTier.conditions,
      tier: overridenRuleTier.tier,
      overrider: overridenRuleTier.overrider,
    );
  }

  factory OverridenRuleTierDto.fromJson(Map<String, dynamic> json) =>
      _$OverridenRuleTierDtoFromJson(json);
}