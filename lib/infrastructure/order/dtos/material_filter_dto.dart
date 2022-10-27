import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_filter_dto.freezed.dart';
part 'material_filter_dto.g.dart';

@freezed
class MaterialFilterDto with _$MaterialFilterDto {
  const MaterialFilterDto._();
  const factory MaterialFilterDto({
    @JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
        required List<String> uniquePrincipalName,
    @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
        required List<String> uniqueTherapeuticClass,
    @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
        required List<String> uniqueItemBrand,
  }) = _MaterialFilterDto;

  MaterialFilter toDomain() {
    return MaterialFilter(
      uniqueItemBrand: uniqueItemBrand,
      uniquePrincipalName: uniquePrincipalName,
      uniqueTherapeuticClass: uniqueTherapeuticClass,
    );
  }

  factory MaterialFilterDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialFilterDtoFromJson(json);
}
