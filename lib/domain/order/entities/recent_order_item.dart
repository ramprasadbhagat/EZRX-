import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';

part 'recent_order_item.freezed.dart';

@freezed
class RecentOrderItem with _$RecentOrderItem {
  const RecentOrderItem._();
  factory RecentOrderItem({
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String defaultMaterialDescription,
    required int qty,
    required ZpPrice unitPrice,
    required TotalPrice totalPrice,
    required DocumentType orderType,
    required OrderNumber orderNumber,
    required StringValue ezrxNumber,
    required String orderBy,
    required String warehouseStorageCondition,
    required bool available,
    required bool isMarketplace,
    required String seller,
    required String manufactureName,
    required ProductImages productImages,
    @Default(false) bool isFavourite,
  }) = _OrderHistoryItem;

  factory RecentOrderItem.empty() => RecentOrderItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        orderType: DocumentType(''),
        orderNumber: OrderNumber(''),
        ezrxNumber: StringValue(''),
        orderBy: '',
        available: false,
        defaultMaterialDescription: '',
        warehouseStorageCondition: '',
        isMarketplace: false,
        manufactureName: '',
        seller: '',
        productImages: ProductImages.empty(),
      );
}
