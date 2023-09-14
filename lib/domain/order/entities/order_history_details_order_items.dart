import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_items.freezed.dart';

@freezed
class OrderHistoryDetailsOrderItem with _$OrderHistoryDetailsOrderItem {
  const OrderHistoryDetailsOrderItem._();
  factory OrderHistoryDetailsOrderItem({
    required OrderItemType type,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required int qty,
    required ZpPrice unitPrice,
    required TotalPrice totalPrice,
    required double tax,
    required SAPStatus sAPStatus,
    required DateTimeStringValue plannedDeliveryDate,
    required int pickedQuantity,
    required String batch,
    required DateTimeStringValue expiryDate,
    required Remarks lineReferenceNotes,
    required bool isTenderContractMaterial,
    required List<OrderHistoryDetailsOrderItemDetails> details,
    required OrderHistoryDetailsOrderItemTenderContractDetails
        tenderContractDetails,
    required PrincipalName principalName,
    required ProductImages productImages,
    required String governmentMaterialCode,
    required MaterialStockInfo materialStockInfo,
    required PriceAggregate priceAggregate,
    required MaterialInfoType productType,
  }) = _OrderHistoryDetailsOrderItem;

  factory OrderHistoryDetailsOrderItem.empty() => OrderHistoryDetailsOrderItem(
        type: OrderItemType(''),
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        tax: 0.0,
        sAPStatus: SAPStatus(''),
        plannedDeliveryDate: DateTimeStringValue(''),
        pickedQuantity: 0,
        batch: '',
        expiryDate: DateTimeStringValue(''),
        lineReferenceNotes: Remarks(''),
        isTenderContractMaterial: false,
        details: <OrderHistoryDetailsOrderItemDetails>[],
        tenderContractDetails:
            OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        principalName: PrincipalName(''),
        productImages: ProductImages.empty(),
        governmentMaterialCode: '',
        materialStockInfo: MaterialStockInfo.empty(),
        priceAggregate: PriceAggregate.empty(),
        productType: MaterialInfoType(''),
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromOrderHistoryDetails(
        orderHistoryDetailsOrderItem: this,
      );

  String get batchAndExpiryDate => '$batch:${expiryDate.dateString}';
  String get deliveryDate =>
      plannedDeliveryDate.isNotEmpty ? plannedDeliveryDate.dateString : '-';
  OrderHistoryDetailsOrderItem copyWithTaxCal({
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) =>
      copyWith(
        totalPrice: salesOrganisationConfigs.taxDisplayForOrderHistoryMaterial
            ? TotalPrice('${totalPrice.totalPrice + tax}')
            : totalPrice,
        unitPrice: salesOrganisationConfigs.taxDisplayForOrderHistoryMaterial
            ? ZpPrice('${unitPrice.zpPrice + tax / qty}')
            : unitPrice,
      );
  StatusType get productTag {
    if (type.isMaterialTypeBonus && unitPrice.isZPPriceZero) {
      return StatusType('Bonus');
    }
    if (priceAggregate.salesOrgConfig.addOosMaterials
            .getOrDefaultValue(false) &&
        (materialStockInfo.stockInfos.isEmpty ||
            !materialStockInfo.stockInfos
                .any((element) => element.inStock.isMaterialInStock))) {
      return StatusType('OOS-Preorder');
    }
    if (!priceAggregate.salesOrgConfig.addOosMaterials
            .getOrDefaultValue(false) &&
        (materialStockInfo.stockInfos.isEmpty ||
            !materialStockInfo.stockInfos
                .any((element) => element.inStock.isMaterialInStock))) {
      return StatusType('Out of Stock');
    }

    return StatusType('');
  }
}

extension ViewByOrderDetailsListExtension
    on List<OrderHistoryDetailsOrderItem> {
  List<ViewByOrdersGroup> get getViewByOrderItemDetailsList {
    return List<OrderHistoryDetailsOrderItem>.from(this)
        .groupListsBy((item) => item.principalName)
        .entries
        .map(
          (entry) => ViewByOrdersGroup(
            createdDate: DateTimeStringValue(''),
            viewByOrderItem: entry.value,
            principalName: entry.key,
            orderHeaders: <OrderHistoryDetailsOrderHeader>[],
          ),
        )
        .toList();
  }
}
