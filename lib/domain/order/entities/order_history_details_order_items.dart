import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
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
    required double unitPrice,
    required double originPrice,
    required double totalPrice,
    required double tax,
    required OrderStepValue sAPStatus,
    required DateTimeStringValue plannedDeliveryDate,
    required int pickedQuantity,
    required StringValue batch,
    required DateTimeStringValue expiryDate,
    required Remarks lineReferenceNotes,
    required LineNumber lineNumber,
    required bool isTenderContractMaterial,
    required List<OrderHistoryDetailsOrderItemDetails> details,
    required OrderHistoryDetailsOrderItemTenderContractDetails
        tenderContractDetails,
    required PrincipalData principalData,
    required ProductImages productImages,
    required String governmentMaterialCode,
    required MaterialStockInfo materialStockInfo,
    required PriceAggregate priceAggregate,
    required MaterialInfoType productType,
    required String parentId,
    required MaterialInfo material,
    required bool promoStatus,
    required bool isCounterOffer,
    required bool hidePrice,
    required bool isMarketPlace,
  }) = _OrderHistoryDetailsOrderItem;

  factory OrderHistoryDetailsOrderItem.empty() => OrderHistoryDetailsOrderItem(
        type: OrderItemType(''),
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: 0.0,
        originPrice: 0.0,
        totalPrice: 0.0,
        tax: 0.0,
        sAPStatus: OrderStepValue(''),
        plannedDeliveryDate: DateTimeStringValue(''),
        pickedQuantity: 0,
        batch: StringValue(''),
        expiryDate: DateTimeStringValue(''),
        lineReferenceNotes: Remarks(''),
        lineNumber: LineNumber(''),
        isTenderContractMaterial: false,
        details: <OrderHistoryDetailsOrderItemDetails>[],
        tenderContractDetails:
            OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        principalData: PrincipalData.empty(),
        productImages: ProductImages.empty(),
        governmentMaterialCode: '',
        materialStockInfo: MaterialStockInfo.empty(),
        priceAggregate: PriceAggregate.empty(),
        productType: MaterialInfoType(''),
        parentId: '',
        material: MaterialInfo.empty(),
        promoStatus: false,
        isCounterOffer: false,
        hidePrice: false,
        isMarketPlace: false,
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromOrderHistoryDetails(
        orderHistoryDetailsOrderItem: this,
      );

  OrderHistoryDetailsOrderItem copyWithTaxCal({
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

  /*ProductTag is used for displaying tag in OrderSuccess detail page */
  StatusType get productTag {
    if (isBonus && !priceAggregate.salesOrgConfig.salesOrg.isID) {
      return StatusType('Bonus');
    }
    if (!priceAggregate.salesOrgConfig.hideStockDisplay &&
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
      return StatusType('Out of stock');
    }

    return StatusType('');
  }

  bool get inStock => materialStockInfo.stockInfos
      .any((element) => element.inStock.isMaterialInStock);

  /*For ViewByOrderDetails only bonus tag is displayed align with web */
  StatusType get orderDetailBonusTag => StatusType(isBonus ? 'Bonus' : '');

  bool get showOfferTag => !isBonus && promoStatus;

  bool get isBonus => type.isMaterialTypeBonus && unitPrice == 0;

  bool get batchNumHasData => batch.isValid() || expiryDate.isNotEmpty;

  String itemUnitPrice(
    bool isIDMarket,
  ) =>
      _itemPrice(
        unitPrice,
        isIDMarket,
      );

  String itemNetPrice(
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

  double get taxPercentage =>
      unitPrice == 0 ? 0 : (tax * 100 / unitPrice).roundToDouble();

  String _itemPrice(
    double price,
    bool isIDMarket,
  ) {
    if (type.isMaterialTypeBonus) return isIDMarket ? '0' : 'FREE';
    const displayPriceNotAvailable = 'Price Not Available';

    if (price == 0 || hidePrice) return displayPriceNotAvailable;

    return price.toString();
  }

  MaterialInfo get reOrderMaterialInfo => MaterialInfo.empty().copyWith(
        type: productType,
        materialNumber: materialNumber,
        parentID: productType.typeBundle ? parentId : '',
        quantity: MaterialQty(qty),
        stockInfos: materialStockInfo.stockInfos,
      );

  bool get showMaterialListPrice => !hidePrice && getListPrice > unitPrice;

  double get getListPrice => originPrice - tax;

  String combinationCode({required bool showGMCPart}) => <String>[
        materialNumber.displayMatNo,
        if (showGMCPart && governmentMaterialCode.isNotEmpty)
          governmentMaterialCode,
      ].join(' | ');

  bool get showItemTax =>
      priceAggregate.showTaxBreakDown && !type.isMaterialTypeBonus;

  bool get hasInValidPrice =>
      !type.isMaterialTypeBonus && (hidePrice || unitPrice == 0);

  String get itemOriginPrice => !priceAggregate.price.isValid
      ? 'Price Not Available'
      : originPrice.toString();
}

extension ViewByOrderDetailsListExtension
    on List<OrderHistoryDetailsOrderItem> {
  List<OrderHistoryDetailsOrderItem> get zpItemOnly =>
      where((e) => !e.isMarketPlace).toList();

  List<OrderHistoryDetailsOrderItem> get mpItemOnly =>
      where((e) => e.isMarketPlace).toList();

  bool get containsMaterialsWithInvalidPrice =>
      any((element) => element.hasInValidPrice);

  List<ViewByOrdersGroup> get materialItemDetailsList {
    return List<OrderHistoryDetailsOrderItem>.from(this)
        .where((element) => element.productType.typeMaterial)
        .groupListsBy((item) => item.principalData.principalName)
        .entries
        .map(
          (entry) => ViewByOrdersGroup(
            createdDate: DateTimeStringValue(''),
            viewByOrderItem: entry.value,
            principalName: entry.key,
            parentId: MaterialNumber(''),
            orderHeaders: <OrderHistoryDetails>[],
          ),
        )
        .toList();
  }

  List<ViewByOrdersGroup> get bundleItemDetailsList {
    return List<OrderHistoryDetailsOrderItem>.from(this)
        .where((element) => element.productType.typeBundle)
        .groupListsBy((item) => item.parentId)
        .entries
        .map(
          (entry) => ViewByOrdersGroup(
            createdDate: DateTimeStringValue(''),
            viewByOrderItem: entry.value,
            principalName: PrincipalName(''),
            parentId: MaterialNumber(entry.key),
            orderHeaders: <OrderHistoryDetails>[],
          ),
        )
        .toList();
  }
}
