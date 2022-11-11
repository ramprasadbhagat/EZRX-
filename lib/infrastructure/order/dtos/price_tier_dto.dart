import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'price_tier_dto.freezed.dart';
part 'price_tier_dto.g.dart';

@freezed
class PriceTierDto with _$PriceTierDto {
  const PriceTierDto._();
  @HiveType(typeId: 8, adapterName: 'PriceTierDtoAdapter')
  const factory PriceTierDto({
    @JsonKey(name: 'Tier', defaultValue: '')
    @HiveField(19, defaultValue: '')
        required String tier,
    @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
    @HiveField(20, defaultValue: <PriceTierItemDto>[])
        required List<PriceTierItemDto> items,
  }) = _PriceTierDto;

  factory PriceTierDto.fromDomain(PriceTier priceTier) {
    return PriceTierDto(
      tier: priceTier.tier,
      items:
          priceTier.items.map((e) => PriceTierItemDto.fromDomain(e)).toList(),
    );
  }

  PriceTier toDomain() {
    final sortedItem = items.map((e) => e.toDomain()).toList()
      ..sort((a, b) => a.quantity.compareTo(b.quantity));

    return PriceTier(
      tier: tier,
      items: sortedItem,
    );
  }

  factory PriceTierDto.fromJson(Map<String, dynamic> json) =>
      _$PriceTierDtoFromJson(json);
}

@freezed
class PriceTierItemDto with _$PriceTierItemDto {
  const PriceTierItemDto._();
  @HiveType(typeId: 9, adapterName: 'PriceTierItemDtoAdapter')
  const factory PriceTierItemDto({
    @JsonKey(name: 'Type', defaultValue: '')
    @HiveField(21, defaultValue: '')
        required String type,
    @JsonKey(name: 'ApplyBonus', defaultValue: false)
    @HiveField(22, defaultValue: 0)
        required bool applyBonus,
    @JsonKey(name: 'Sequence', defaultValue: 0)
    @HiveField(23, defaultValue: 0)
        required int sequence,
    @JsonKey(name: 'Quantity', defaultValue: 0)
    @HiveField(24, defaultValue: 0)
        required int quantity,
    @JsonKey(name: 'Rate', defaultValue: 0)
    @HiveField(6, defaultValue: 0)
        required double rate,
  }) = _PriceTierItemDto;

  factory PriceTierItemDto.fromDomain(PriceTierItem priceTierItem) {
    return PriceTierItemDto(
      type: priceTierItem.type,
      applyBonus: priceTierItem.applyBonus,
      sequence: priceTierItem.sequence,
      quantity: priceTierItem.quantity,
      rate: priceTierItem.rate,
    );
  }

  PriceTierItem toDomain() => PriceTierItem(
        type: type,
        applyBonus: applyBonus,
        sequence: sequence,
        quantity: quantity,
        rate: rate,
      );

  factory PriceTierItemDto.fromJson(Map<String, dynamic> json) =>
      _$PriceTierItemDtoFromJson(json);
}
