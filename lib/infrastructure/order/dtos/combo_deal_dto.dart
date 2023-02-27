import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_amount_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_group_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_qty_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_sku_tier_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'combo_deal_dto.freezed.dart';
part 'combo_deal_dto.g.dart';

@freezed
class ComboDealDto with _$ComboDealDto {
  const ComboDealDto._();
  @HiveType(typeId: 24, adapterName: 'ComboDealDtoAdapter')
  const factory ComboDealDto({
    @Default(ComboDealGroupDealDto.empty)
    @JsonKey(name: 'groupDeal')
    @HiveField(0, defaultValue: ComboDealGroupDealDto.empty)
        ComboDealGroupDealDto groupDeal,
    @JsonKey(name: 'flexiSKUTier', defaultValue: [])
    @HiveField(1, defaultValue: [])
        required List<ComboDealSKUTierDto> flexiSKUTier,
    @JsonKey(name: 'flexiQtyTier', defaultValue: [])
    @HiveField(2, defaultValue: [])
        required List<ComboDealQtyTierDto> flexiQtyTier,
    @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
    @HiveField(3, defaultValue: [])
        required List<ComboDealAmountTierDto> flexiAmountTier,
    @JsonKey(name: 'materialComboDeals', defaultValue: [])
    @HiveField(4, defaultValue: [])
        required List<ComboDealMaterialSetDto> materialComboDeals,
  }) = _ComboDealDto;

  factory ComboDealDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealDtoFromJson(json);

  ComboDeal get toDomain => ComboDeal(
        groupDeal: groupDeal.toDomain,
        flexiSKUTier: flexiSKUTier.map((e) => e.toDomain).toList(),
        flexiQtyTier: flexiQtyTier.map((e) => e.toDomain).toList(),
        flexiAmountTier: flexiAmountTier.map((e) => e.toDomain).toList(),
        materialComboDeals: materialComboDeals.map((e) => e.toDomain).toList(),
      );

  factory ComboDealDto.fromDomain(ComboDeal domain) => ComboDealDto(
        groupDeal: ComboDealGroupDealDto.fromDomain(domain.groupDeal),
        flexiSKUTier: domain.flexiSKUTier
            .map(
              (e) => ComboDealSKUTierDto.fromDomain(e),
            )
            .toList(),
        flexiQtyTier: domain.flexiQtyTier
            .map(
              (e) => ComboDealQtyTierDto.fromDomain(e),
            )
            .toList(),
        flexiAmountTier: domain.flexiAmountTier
            .map(
              (e) => ComboDealAmountTierDto.fromDomain(e),
            )
            .toList(),
        materialComboDeals: domain.materialComboDeals
            .map(
              (e) => ComboDealMaterialSetDto.fromDomain(e),
            )
            .toList(),
      );

  static const empty = ComboDealDto(
    flexiSKUTier: [],
    flexiQtyTier: [],
    flexiAmountTier: [],
    materialComboDeals: [],
  );
}
