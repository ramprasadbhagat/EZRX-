import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details.freezed.dart';

@freezed
class OrderHistoryDetails with _$OrderHistoryDetails {
  const OrderHistoryDetails._();
  factory OrderHistoryDetails({
    required double totalTax,
    required double orderValue,
    required double deliveryFee,
    required double manualFee,
    required double totalValue,
    required double totalDiscount,
    required OrderStepValue processingStatus,
    required DateTimeStringValue requestedDeliveryDate,
    required DateTimeStringValue expectedDeliveryDate,
    required DocumentType type,
    required PhoneNumber telephoneNumber,
    required DateTimeStringValue createdDate,
    required String eZRXNumber,
    required StringValue orderBy,
    required String referenceNotes,
    required OrderNumber
        orderNumber, //used for orderHistory api in view vy order section
    required String soldTo,
    required String shipTo,
    required CompanyName companyName,
    required POReference pOReference,
    required String shipToAddress,
    required String soldToAddress,
    required StringValue invoiceNumber,
    required String orderReason,
    required int itemCount,
    required List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
    required OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
    required SpecialInstructions orderHistoryDetailsSpecialInstructions,
    required List<PoDocuments> orderHistoryDetailsPoDocuments,
    required bool isMarketPlace,
  }) = _OrderHistoryDetails;

  factory OrderHistoryDetails.empty() => OrderHistoryDetails(
        totalTax: 0.0,
        deliveryFee: 0.0,
        manualFee: 0.0,
        totalDiscount: 0.0,
        totalValue: 0.0,
        processingStatus: OrderStepValue(''),
        requestedDeliveryDate: DateTimeStringValue(''),
        type: DocumentType(''),
        telephoneNumber: PhoneNumber(''),
        orderValue: 0.0,
        createdDate: DateTimeStringValue(''),
        expectedDeliveryDate: DateTimeStringValue(''),
        eZRXNumber: '',
        orderBy: StringValue(''),
        referenceNotes: '',
        companyName: CompanyName(''),
        orderNumber: OrderNumber(''),
        pOReference: POReference(''),
        shipTo: '',
        soldTo: '',
        shipToAddress: '',
        soldToAddress: '',
        invoiceNumber: StringValue(''),
        orderReason: '',
        orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[],
        orderHistoryDetailsPaymentTerm: OrderHistoryDetailsPaymentTerm.empty(),
        orderHistoryDetailsSpecialInstructions: SpecialInstructions(''),
        orderHistoryDetailsPoDocuments: <PoDocuments>[],
        itemCount: 0,
        isMarketPlace: false,
      );

  double get grandTotalWithTax => orderValue + totalTax;

  bool get poDocumentsAvailable => orderHistoryDetailsPoDocuments.isNotEmpty;

  List<MaterialQueryInfo> get allItemQueryInfo => items
      .map(
        (item) => item.orderItem.queryInfo,
      )
      .toList();

  List<OrderHistoryDetailsBonusAggregate> get items {
    final orderHistoryDetailsOrderItemsList =
        <OrderHistoryDetailsBonusAggregate>[];

    for (final items in orderHistoryDetailsOrderItem) {
      if (items.type.isMaterialTypeComm) {
        final orderHistoryDetailsOrderItem = OrderHistoryDetailsBonusAggregate(
          orderItem: items,
          details: items.details,
          tenderContractDetails: items.tenderContractDetails,
          bonusList: <OrderHistoryDetailsOrderItem>[],
        );

        orderHistoryDetailsOrderItemsList.add(orderHistoryDetailsOrderItem);
      } else {
        if (orderHistoryDetailsOrderItemsList.isNotEmpty) {
          orderHistoryDetailsOrderItemsList.last =
              orderHistoryDetailsOrderItemsList.last.copyWith(
            bonusList: List<OrderHistoryDetailsOrderItem>.from(
              orderHistoryDetailsOrderItemsList.last.bonusList,
            )..add(items),
          );
        }
      }
    }

    return orderHistoryDetailsOrderItemsList;
  }

  int get orderItemsCount => orderHistoryDetailsOrderItem.fold<int>(
        0,
        (previous, current) => previous + current.qty,
      );

  OrderHistoryDetails copyWithStock({
    required List<MaterialStockInfo> stockInfoList,
    required List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
    required List<PriceAggregate> priceAggregate,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) =>
      copyWith(
        orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem
            .map(
              (e) => e.copyWith(
                materialStockInfo: stockInfoList.firstWhere(
                  (element) => element.materialNumber == e.materialNumber,
                ),
                priceAggregate: priceAggregate
                    .firstWhere(
                      (element) =>
                          element.getMaterialNumber == e.materialNumber,
                      orElse: () => PriceAggregate.empty(),
                    )
                    .copyWith(
                      salesOrgConfig: salesOrganisationConfigs,
                    ),
              ),
            )
            .toList(),
      );

  OrderHistoryDetailsOrderItem getOrderHistoryDetailsOrderItem({
    required MaterialNumber materialNumber,
  }) {
    return orderHistoryDetailsOrderItem
        .where((element) => element.materialNumber == materialNumber)
        .first;
  }

  double subTotal(bool showSubTotalExcludingTax) => showSubTotalExcludingTax
      ? orderValue //order value is excl tax
      : totalValue; //total value is incl tax

  String get totalTaxPercentage {
    /// Retrieves the total tax percentage for the entire order by extracting it from the first order item
    /// that includes tax. This approach uses the first order item with a positive tax percentage,
    /// assuming that all items with tax share the same tax rate during order creation.
    /// The [orElse] parameter ensures a fallback to an empty order item if no taxable item is found.
    final firstOrderItemWithTax = orderHistoryDetailsOrderItem.firstWhere(
      (element) => element.taxPercentage > 0,
      orElse: () => OrderHistoryDetailsOrderItem.empty(),
    );

    return firstOrderItemWithTax.isNotEmpty
        ? StringUtils.displayNumberWithDecimal(
            firstOrderItemWithTax.taxPercentage,
          )
        : '';
  }

  bool get orderContainsMaterialsWithInvalidPrice =>
      orderHistoryDetailsOrderItem.any((element) => element.hasInValidPrice);
}

extension ViewByOrderListExtension on List<OrderHistoryDetails> {
  List<ViewByOrdersGroup> get getViewByOrderGroupList {
    return List<OrderHistoryDetails>.from(this)
        .groupListsBy((item) => item.createdDate)
        .entries
        .map(
          (entry) => ViewByOrdersGroup(
            createdDate: entry.key,
            orderHeaders: entry.value,
            principalName: PrincipalName(''),
            viewByOrderItem: <OrderHistoryDetailsOrderItem>[],
            parentId: MaterialNumber(''),
          ),
        )
        .toList();
  }
}
