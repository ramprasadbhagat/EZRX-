import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_template_material_dto.freezed.dart';

part 'order_template_material_dto.g.dart';

@freezed
class OrderTemplateMaterialDto with _$OrderTemplateMaterialDto {
  const OrderTemplateMaterialDto._();

  const factory OrderTemplateMaterialDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'taxClassification', defaultValue: '')
        required String taxClassification,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
        required String materialGroup4,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
  }) = _OrderTemplateMaterialDto;

  factory OrderTemplateMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$OrderTemplateMaterialDtoFromJson(json);

  factory OrderTemplateMaterialDto.fromDomain(
    OrderTemplateMaterial orderTemplate,
  ) {
    return OrderTemplateMaterialDto(
      materialNumber: orderTemplate.materialNumber.getOrDefaultValue(''),
      qty: orderTemplate.qty,
      type: orderTemplate.type,
      principalName: orderTemplate.principalName,
      materialDescription: orderTemplate.materialDescription,
      hidePrice: orderTemplate.hidePrice,
      taxClassification: orderTemplate.taxClassification.getOrDefaultValue(''),
      materialGroup4: orderTemplate.materialGroup4.getOrDefaultValue(''),
      hasValidTenderContract: orderTemplate.hasValidTenderContract,
    );
  }

  OrderTemplateMaterial toDomain() {
    return OrderTemplateMaterial(
      materialNumber: MaterialNumber(materialNumber),
      qty: qty,
      type: type,
      principalName: principalName,
      materialDescription: materialDescription,
      hidePrice: hidePrice,
      taxClassification: MaterialTaxClassification(taxClassification),
      materialGroup4: MaterialGroup.four(materialGroup4),
      hasValidTenderContract: hasValidTenderContract,
    );
  }
}
