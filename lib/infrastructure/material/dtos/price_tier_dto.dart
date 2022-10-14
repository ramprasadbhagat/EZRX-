import 'package:ezrxmobile/domain/material/entities/price_tier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_tier_dto.freezed.dart';
part 'price_tier_dto.g.dart';

@freezed
class PriceTierDto with _$PriceTierDto {
  const PriceTierDto._();
  const factory PriceTierDto({
    @JsonKey(name: 'Tier', defaultValue: '') required String tier,
    @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
        required List<PriceTierItemDto> items,
  }) = _PriceTierDto;

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
  const factory PriceTierItemDto({
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'ApplyBonus', defaultValue: false) required bool applyBonus,
    @JsonKey(name: 'Sequence', defaultValue: 0) required int sequence,
    @JsonKey(name: 'Quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'Rate', defaultValue: 0) required double rate,
  }) = _PriceTierItemDto;

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
