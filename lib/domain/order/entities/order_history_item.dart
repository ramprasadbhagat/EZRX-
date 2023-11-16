import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'order_history_item.freezed.dart';

@freezed
class OrderHistoryItem with _$OrderHistoryItem {
  const OrderHistoryItem._();
  factory OrderHistoryItem({
    required MaterialNumber materialNumber,
    required String materialDescription,
    required int qty,
    required ZpPrice unitPrice,
    required TotalPrice totalPrice,
    required OrderStepValue status,
    required DateTimeStringValue deliveryDate,
    required OrderNumber orderNumber,
    required DateTimeStringValue createdDate,
    required StringValue batch,
    required String orderBy,
    required DocumentType orderType,
    required DateTimeStringValue expiryDate,
    required POReference pOReference,
    required String manufactureName,
    required InvoiceData invoiceData,
    required bool isBonusMaterial,
    required PhoneNumber telephoneNumber,
    required ProductImages productImages,
    required DateTimeStringValue requestedDeliveryDate,
    required SpecialInstructions specialInstructions,
    required double tax,
    required List<PoDocuments> orderHistoryItemPoAttachments,
    required StringValue ezrxNumber,
    required bool isBundle,
    required bool promoStatus,
    required LineNumber lineNumber,
  }) = _OrderHistoryItem;

  factory OrderHistoryItem.empty() => OrderHistoryItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        status: OrderStepValue(''),
        deliveryDate: DateTimeStringValue(''),
        orderNumber: OrderNumber(''),
        createdDate: DateTimeStringValue(''),
        batch: StringValue(''),
        expiryDate: DateTimeStringValue(''),
        invoiceData: InvoiceData.empty(),
        isBonusMaterial: false,
        manufactureName: '',
        pOReference: POReference(''),
        telephoneNumber: PhoneNumber(''),
        productImages: ProductImages.empty(),
        requestedDeliveryDate: DateTimeStringValue(''),
        specialInstructions: SpecialInstructions(''),
        tax: 0.0,
        orderBy: '',
        orderType: DocumentType(''),
        orderHistoryItemPoAttachments: <PoDocuments>[],
        ezrxNumber: StringValue(''),
        isBundle: false,
        promoStatus: false,
        lineNumber: LineNumber(''),
      );

  bool get isOfferItem => !isBundle && !isBonusMaterial && promoStatus;

  OrderHistoryItem copyWithTaxCal({
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

  MaterialInfo get reOrderMaterialInfo => MaterialInfo.empty().copyWith(
        type: MaterialInfoType.material(),
        materialNumber: materialNumber,
        quantity: MaterialQty(qty),
      );

  StatusType get productTag => StatusType(isBonusMaterial ? 'Bonus' : '');

  bool get isEmpty => this == OrderHistoryItem.empty();

  String itemTotalPrice(bool isIdMarket) {
    if (isIdMarket && isBonusMaterial) return '0';

    return isBonusMaterial ? 'FREE' : totalPrice.totalPrice.toStringAsFixed(2);
  }
}

extension ViewByItemListExtension on List<OrderHistoryItem> {
  List<ViewByItemGroup> get getViewByOrderItemList {
    return List<OrderHistoryItem>.from(this)
        .groupListsBy((item) => item.createdDate)
        .entries
        .map(
          (entry) => ViewByItemGroup(
            createdDate: entry.key,
            orderHistoryItem: entry.value,
            manufactureName: '',
          ),
        )
        .toList();
  }
}

extension ViewByItemDetailsListExtension on List<OrderHistoryItem> {
  List<ViewByItemGroup> get getViewByOrderItemDetailsList {
    return List<OrderHistoryItem>.from(this)
        .groupListsBy((item) => item.manufactureName)
        .entries
        .map(
          (entry) => ViewByItemGroup(
            createdDate: DateTimeStringValue(''),
            orderHistoryItem: entry.value,
            manufactureName: entry.key,
          ),
        )
        .toList();
  }
}
