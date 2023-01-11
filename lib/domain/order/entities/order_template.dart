import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_template.freezed.dart';

@freezed
class OrderTemplate with _$OrderTemplate {
  const OrderTemplate._();

  const factory OrderTemplate({
    required String templateId,
    required String templateName,
    required List<MaterialItem> items,
    required User user,
  }) = _OrderTemplate;

  List<MaterialQueryInfo> get allMaterialQueryInfo => items
      .map(
        (item) => item.queryInfo,
      )
      .toList();
}
