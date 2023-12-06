import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
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
    required ZpPrice originPrice,
    required TotalPrice totalPrice,
    required OrderStepValue status,
    required DateTimeStringValue deliveryDate,
    required OrderNumber orderNumber,
    required DateTimeStringValue createdDate,
    required StringValue batch,
    required StringValue orderBy,
    required DocumentType orderType,
    required DateTimeStringValue expiryDate,
    required POReference pOReference,
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
    required bool isCounterOffer,
    required LineNumber lineNumber,
    required PrincipalData principalData,
  }) = _OrderHistoryItem;

  factory OrderHistoryItem.empty() => OrderHistoryItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        originPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        status: OrderStepValue(''),
        deliveryDate: DateTimeStringValue(''),
        orderNumber: OrderNumber(''),
        createdDate: DateTimeStringValue(''),
        batch: StringValue(''),
        expiryDate: DateTimeStringValue(''),
        invoiceData: InvoiceData.empty(),
        isBonusMaterial: false,
        pOReference: POReference(''),
        telephoneNumber: PhoneNumber(''),
        productImages: ProductImages.empty(),
        requestedDeliveryDate: DateTimeStringValue(''),
        specialInstructions: SpecialInstructions(''),
        tax: 0.0,
        orderBy: StringValue(''),
        orderType: DocumentType(''),
        orderHistoryItemPoAttachments: <PoDocuments>[],
        ezrxNumber: StringValue(''),
        isBundle: false,
        promoStatus: false,
        isCounterOffer: false,
        lineNumber: LineNumber(''),
        principalData: PrincipalData.empty(),
      );

  bool get isOfferItem => !isBundle && !isBonusMaterial && promoStatus;

  bool get isTypeMaterial => !isBundle && !isBonusMaterial;

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

  bool get isPnGMaterial => isTypeMaterial && principalData.principalCode.isPnG;

  String itemUnitPrice(
    bool isMYExternalSalesRep,
    bool isIDMarket,
  ) =>
      _itemPrice(
        unitPrice.getOrDefaultValue('0'),
        isMYExternalSalesRep,
        isIDMarket,
      );

  String itemTotalPrice(
    bool isMYExternalSalesRep,
    bool isIDMarket,
  ) =>
      _itemPrice(
        totalPrice.getOrDefaultValue('0'),
        isMYExternalSalesRep,
        isIDMarket,
      );

  String _itemPrice(
    String price,
    bool isMYExternalSalesRep,
    bool isIDMarket,
  ) {
    final displayPriceNotAvailable = isMYExternalSalesRep &&
        isPnGMaterial &&
        !invoiceData.invoiceNumber.isValid();

    if (displayPriceNotAvailable) return 'Price Not Available';
    if (isBonusMaterial) return isIDMarket ? '0' : 'FREE';

    return price;
  }

  bool get showMaterialListPrice => originPrice.zpPrice > unitPrice.zpPrice;
}

extension ViewByItemListExtension on List<OrderHistoryItem> {
  List<ViewByItemGroup> get getViewByOrderItemList {
    return List<OrderHistoryItem>.from(this)
        .groupListsBy((item) => item.createdDate.apiDateTimeString)
        .entries
        .map(
          (entry) => ViewByItemGroup(
            createdDate: DateTimeStringValue(entry.key),
            orderHistoryItem: entry.value,
            manufactureName: PrincipalName(''),
          ),
        )
        .toList();
  }

  List<ViewByItemGroup> get getViewByOrderItemDetailsList {
    return List<OrderHistoryItem>.from(this)
        .groupListsBy((item) => item.principalData.principalName)
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
