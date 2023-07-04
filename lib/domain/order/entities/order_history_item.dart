import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    required StatusType status,
    required DateTimeStringValue deliveryDate,
    required OrderNumber orderNumber,
    required DateTimeStringValue createdDate,
    required String batch,
    required String orderBy,
    required DateTimeStringValue expiryDate,
    required POReference pOReference,
    required String manufactureName,
    required String invoiceNumber,
    required bool isBonusMaterial,
    required PhoneNumber telephoneNumber,
    required ProductImages productImages,
    required DateTimeStringValue requestedDeliveryDate,
    required SpecialInstructions specialInstructions,
    required double tax,
  }) = _OrderHistoryItem;

  factory OrderHistoryItem.empty() => OrderHistoryItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        status: StatusType(''),
        deliveryDate: DateTimeStringValue(''),
        orderNumber: OrderNumber(''),
        createdDate: DateTimeStringValue(''),
        batch: '',
        expiryDate: DateTimeStringValue(''),
        invoiceNumber: '',
        isBonusMaterial: false,
        manufactureName: '',
        pOReference: POReference(''),
        telephoneNumber: PhoneNumber(''),
        productImages: ProductImages.empty(),
        requestedDeliveryDate: DateTimeStringValue(''),
        specialInstructions: SpecialInstructions(''),
        tax: 0.0,
        orderBy: '',
      );

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
