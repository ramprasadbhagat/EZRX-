import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
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
    required StringValue invoiceNumber,
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
    required bool hidePrice,
    required StringValue referenceNotes,
    required bool isMarketPlace,
    required TenderContractNumber tenderContractNumber,
    required TenderContractNumber tenderContractReference,
    required int tenderPriceUnit,
    required TenderPrice tenderPrice,
    required TenderContractReason tenderOrderReason,
    required bool isCovid,
    required bool isTenderExpired,
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
        invoiceNumber: StringValue(''),
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
        hidePrice: false,
        lineNumber: LineNumber(''),
        principalData: PrincipalData.empty(),
        referenceNotes: StringValue(''),
        isMarketPlace: false,
        tenderContractNumber: TenderContractNumber.tenderContractNumber(''),
        tenderContractReference:
            TenderContractNumber.tenderContractReference(''),
        tenderPriceUnit: 0,
        tenderPrice: TenderPrice('0'),
        tenderOrderReason: TenderContractReason(''),
        isTenderExpired: false,
        isCovid: false,
      );

  bool get isOfferItem => !isBundle && !isBonusMaterial && promoStatus;

  bool get isTypeMaterial => !isBundle && !isBonusMaterial;

  StringValue get hashId => StringValue(
        '${orderNumber.value.getOrElse(() => '')}${lineNumber.value.getOrElse(() => '')}',
      );

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
    bool isIDMarket,
  ) =>
      _itemPrice(
        unitPrice,
        isIDMarket,
      );

  String itemTotalNetPrice(
    bool showItemTotalExcludingTax,
    bool isIDMarket,
  ) =>
      _itemPrice(
        showItemTotalExcludingTax
            ? unitPrice * qty //item total price excl tax
            : totalPrice, //item total price incl tax
        isIDMarket,
      );

  String itemTotalPrice(
    bool isIDMarket,
  ) =>
      _itemPrice(
        totalPrice,
        isIDMarket,
      );

  String _itemPrice(
    double price,
    bool isIDMarket,
  ) {
    if (isBonusMaterial) return isIDMarket ? '0' : 'FREE';

    const displayPriceNotAvailable = 'Price Not Available';
    if (price == 0 || hidePrice) return displayPriceNotAvailable;

    return price.toString();
  }

  bool get showMaterialListPrice => !hidePrice && getListPrice > unitPrice;

  double get getListPrice => originPrice - tax;

  bool get batchNumHasData => batch.isValid() || expiryDate.isNotEmpty;

  String combinationCode({required bool showGMCPart}) => <String>[
        materialNumber.displayMatNo,
        if (showGMCPart && governmentMaterialCode.isNotEmpty)
          governmentMaterialCode,
      ].join(' | ');

  double get taxPercentage =>
      unitPrice == 0 ? 0 : (tax * 100 / unitPrice).roundToDouble();

  String get manufacturerPrefix => isMarketPlace ? 'Sold by' : '';

  TenderContract get orderItemTenderContract => TenderContract.empty().copyWith(
        tenderOrderReason: tenderOrderReason,
        contractNumber: tenderContractNumber,
        contractReference: StringValue(
          tenderContractReference.getValue(),
        ),
        pricingUnit: tenderPriceUnit,
        tenderPrice: tenderPrice,
        isTenderExpired: isTenderExpired,
      );

  String get sellerName =>
      _isDisplaySellerName ? principalData.principalName.name : '';

  bool get _isDisplaySellerName => isMarketPlace && isBundle;
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
