import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';

part 'recent_order_dto.freezed.dart';
part 'recent_order_dto.g.dart';

@freezed
class RecentOrderDto with _$RecentOrderDto {
  const RecentOrderDto._();

  factory RecentOrderDto({
    @JsonKey(name: 'MaterialCode', defaultValue: '')
        required String materialCode,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'Qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'UnitPrice', defaultValue: 0.0) required double unitPrice,
    @JsonKey(name: 'TotalPrice', defaultValue: 0.0) required double totalPrice,
    @JsonKey(name: 'ManufactureName', defaultValue: '')
        required String manufactureName,
    @JsonKey(name: 'Seller', defaultValue: '') required String seller,
    @JsonKey(name: 'IsMarketplace', defaultValue: false)
        required bool isMarketplace,
    @JsonKey(name: 'OrderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'EZRXNumber', defaultValue: '') required String eZRXNumber,
    @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
        required String warehouseStorageCondition,
    @JsonKey(name: 'Available', defaultValue: false) required bool available,
    @JsonKey(name: 'OrderBy', defaultValue: '') required String orderBy,
    @JsonKey(name: 'OrderType', defaultValue: '') required String orderType,
    @JsonKey(name: 'HidePrice', defaultValue: false) required bool hidePrice,
  }) = _RecentOrderDto;

  factory RecentOrderDto.fromJson(Map<String, dynamic> json) =>
      _$RecentOrderDtoFromJson(json);

  RecentOrderItem toDomain() => RecentOrderItem(
        available: available,
        defaultMaterialDescription: defaultMaterialDescription,
        ezrxNumber: StringValue(eZRXNumber),
        isMarketplace: isMarketplace,
        manufactureName: manufactureName,
        materialNumber: MaterialNumber(materialCode),
        materialDescription: materialDescription,
        orderBy: orderBy,
        orderNumber: OrderNumber(orderNumber),
        orderType: DocumentType(orderType),
        qty: qty,
        seller: seller,
        totalPrice: TotalPrice(totalPrice.toString()),
        unitPrice: ZpPrice(unitPrice.toString()),
        warehouseStorageCondition: warehouseStorageCondition,
        productImages: ProductImages.empty(),
      );
}
