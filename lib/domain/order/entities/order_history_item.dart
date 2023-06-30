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
    required String defaultMaterialDescription,
    required int qty,
    required ZpPrice unitPrice,
    required TotalPrice totalPrice,
    required StatusType status,
    required DateTimeStringValue deliveryDate,
    required String deliveryTime,
    required String lineNumber,
    required double tax,
    required String orderType,
    required OrderNumber orderNumber,
    required String ezrxNumber,
    required DateTimeStringValue createdDate,
    required String createdTime,
    required String orderBy,
    required String purchaseOrderType,
    required String warehouseStorageCondition,
    required bool available,
    required String batch,
    required DateTimeStringValue expiryDate,
    required bool isMarketplace,
    required String seller,
    required String pOReference,
    required String manufactureName,
    required String invoiceNumber,
    required bool isBonusMaterial,
    required String governmentMaterialCode,
    required String telephoneNumber,
    required ProductImages productImages,
  }) = _OrderHistoryItem;

  DateTimeStringValue get deliveryDateTime => DateTimeStringValue(
        '${deliveryDate.getOrDefaultValue('00000000')}$deliveryTime',
      );

  factory OrderHistoryItem.empty() => OrderHistoryItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        status: StatusType(''),
        deliveryDate: DateTimeStringValue(''),
        deliveryTime: '000000',
        lineNumber: '',
        tax: 0.0,
        orderType: '',
        orderNumber: OrderNumber(''),
        ezrxNumber: '',
        createdDate: DateTimeStringValue(''),
        createdTime: '',
        orderBy: '',
        purchaseOrderType: '',
        available: false,
        batch: '',
        defaultMaterialDescription: '',
        expiryDate: DateTimeStringValue(''),
        governmentMaterialCode: '',
        invoiceNumber: '',
        isBonusMaterial: false,
        warehouseStorageCondition: '',
        isMarketplace: false,
        manufactureName: '',
        pOReference: '',
        seller: '',
        telephoneNumber: '',
        productImages: ProductImages.empty(),
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
          ),
        )
        .toList();
  }
}
