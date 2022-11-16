import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_template_material.freezed.dart';

@freezed
class OrderTemplateMaterial with _$OrderTemplateMaterial {
  const OrderTemplateMaterial._();

  const factory OrderTemplateMaterial({
    required MaterialNumber materialNumber,
    required MaterialGroup materialGroup4,
    required int qty,
    required String type,
    required String principalName,
    required String materialDescription,
    required bool hidePrice,
    required bool hasValidTenderContract,
    required MaterialTaxClassification taxClassification,
  }) = _OrderTemplateMaterial;

  factory OrderTemplateMaterial.empty() => OrderTemplateMaterial(
        materialNumber: MaterialNumber(''),
        materialGroup4: MaterialGroup.four(''),
        qty: 0,
        type: '',
        principalName: '',
        materialDescription: '',
        hidePrice: false,
        hasValidTenderContract: false,
        taxClassification: MaterialTaxClassification(''),
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromOrderTemplate(
        orderMaterial: this,
      );
}
