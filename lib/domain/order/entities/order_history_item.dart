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
    required double unitPrice,
    required double originPrice,
    required double totalPrice,
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
    required String governmentMaterialCode,
  }) = _OrderHistoryItem;

  factory OrderHistoryItem.empty() => OrderHistoryItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: 0.0,
        originPrice: 0.0,
        totalPrice: 0.0,
        status: OrderStepValue(''),
        deliveryDate: DateTimeStringValue(''),
        orderNumber: OrderNumber(''),
        createdDate: DateTimeStringValue(''),
        batch: StringValue(''),
        expiryDate: DateTimeStringValue(''),
        invoiceData: InvoiceData.empty(),
        isBonusMaterial: false,
        governmentMaterialCode: '',
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
            ? totalPrice + tax
            : totalPrice,
        unitPrice: salesOrganisationConfigs.taxDisplayForOrderHistoryMaterial
            ? unitPrice + tax / qty
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
        unitPrice,
        isMYExternalSalesRep,
        isIDMarket,
      );

  String itemTotalNetPrice(
    bool isMYExternalSalesRep,
    bool isIDMarket,
  ) =>
      _itemPrice(
        unitPrice * qty,
        isMYExternalSalesRep,
        isIDMarket,
      );

  String itemTotalPrice(
    bool isMYExternalSalesRep,
    bool isIDMarket,
  ) =>
      _itemPrice(
        totalPrice,
        isMYExternalSalesRep,
        isIDMarket,
      );

  String _itemPrice(
    double price,
    bool isMYExternalSalesRep,
    bool isIDMarket,
  ) {
    const displayPriceNotAvailable = 'Price Not Available';
    final invoiceNumberValid = invoiceData.invoiceNumber.isValid();

    if (isMYExternalSalesRep && isPnGMaterial && !invoiceNumberValid) {
      return displayPriceNotAvailable;
    }
    if (isBonusMaterial) return isIDMarket ? '0' : 'FREE';
    if (price == 0) return displayPriceNotAvailable;

    return price.toString();
  }

  bool get showMaterialListPrice => originPrice > unitPrice;

  bool get batchNumHasData => batch.isValid() || expiryDate.isNotEmpty;

  String combinationCode({required bool showGMCPart}) => <String>[
        materialNumber.displayMatNo,
        if (showGMCPart && governmentMaterialCode.isNotEmpty)
          governmentMaterialCode,
      ].join(' | ');

  double get taxPercentage =>
      double.tryParse(
        (tax / unitPrice * 100).toStringAsExponential(2),
      ) ??
      0;
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
