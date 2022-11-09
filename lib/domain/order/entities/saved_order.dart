import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_order.freezed.dart';

@freezed
class SavedOrder with _$SavedOrder {
  const SavedOrder._();
  const factory SavedOrder({
    required String id,
    required List<MaterialItem> items,
    required bool isDraftOrder,
    required bool isSelected,
    required bool isDeleted,
    required String billingDocument,
    required String eZRxNumber,
    required SoldToParty soldToParty,
    required ShipToParty shipToParty,
    required CompanyName companyName,
    // TODO: use float or int
    required num totalOrderValue,
    required String requestedDeliveryDate,
  }) = _SavedOrder;

  factory SavedOrder.empty() => SavedOrder(
        id: '',
        items: <MaterialItem>[],
        isDraftOrder: false,
        isSelected: false,
        isDeleted: false,
        billingDocument: '',
        eZRxNumber: '',
        soldToParty: SoldToParty(''),
        shipToParty: ShipToParty(''),
        companyName: CompanyName(''),
        totalOrderValue: 0.0,
        requestedDeliveryDate: '',
      );

  List<MaterialQueryInfo> get allMaterialQueryInfo => items
      .map(
        (item) => item.queryInfo,
      )
      .toList();
}
