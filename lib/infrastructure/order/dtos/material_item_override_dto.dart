import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_override_dto.freezed.dart';
part 'material_item_override_dto.g.dart';

@freezed
class MaterialItemOverrideDto with _$MaterialItemOverrideDto {
  const MaterialItemOverrideDto._();

  const factory MaterialItemOverrideDto({
    @JsonKey(name: 'reference', defaultValue: '') required String reference,
    @JsonKey(name: 'valueOverride', defaultValue: <ValueOverrideDto>[])
        required List<ValueOverrideDto> valueOverride,
    //TODO: Implement later due to not know the data type
    @JsonKey(name: 'percentageOverride') dynamic percentageOverride,
  }) = _MaterialItemOverrideDto;

  MaterialItemOverride toDomain() => MaterialItemOverride(
        reference: reference,
        valueOverride: valueOverride.map((e) => e.toDomain()).toList(),
        percentageOverride: percentageOverride,
      );

  factory MaterialItemOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemOverrideDtoFromJson(json);
}

@freezed
class ValueOverrideDto with _$ValueOverrideDto {
  const ValueOverrideDto._();
  const factory ValueOverrideDto({
    @JsonKey(name: 'code', defaultValue: '') required String code,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
  }) = _ValueOverrideDto;

  ValueOverride toDomain() => ValueOverride(
        code: code,
        price: price,
        currency: Currency(currency),
      );

  factory ValueOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$ValueOverrideDtoFromJson(json);
}
