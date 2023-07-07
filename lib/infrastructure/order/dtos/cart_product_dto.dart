import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/cart_product.dart';


part 'cart_product_dto.freezed.dart';
part 'cart_product_dto.g.dart';

@freezed
class CartProductDto with _$CartProductDto {
  const CartProductDto._();
  const factory CartProductDto({
    @JsonKey(name: 'ProductID', defaultValue: '') required String productID,
    @JsonKey(name: 'ParentID', defaultValue: '') required String parentID,
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'Quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'materialNumber', defaultValue: '') required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '') required String materialDescription,
    @JsonKey(name: 'therapeuticClass', defaultValue: '') required String therapeuticClass,
    @JsonKey(name: 'taxClassification', defaultValue: '') required String taxClassification,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '') required String itemRegistrationNumber,
    @JsonKey(name: 'genericMaterialName', defaultValue: '') required String genericMaterialName,

  }) = _CartProductDto;
  factory CartProductDto.fromDomain(
    CartProduct cartItemDetails,
  ) {
    return CartProductDto(
      genericMaterialName: cartItemDetails.genericMaterialName,
      itemRegistrationNumber: cartItemDetails.itemRegistrationNumber,
      materialDescription: cartItemDetails.materialDescription,
      materialNumber: cartItemDetails.materialNumber.getOrCrash(),
      parentID: cartItemDetails.parentID,
      productID: cartItemDetails.productID.getOrCrash(),
      quantity: cartItemDetails.quantity,
      taxClassification: cartItemDetails.taxClassification,
      therapeuticClass: cartItemDetails.therapeuticClass,
      type: cartItemDetails.type.getOrCrash(),
      
    );
  }
  CartProduct get toDomain  {
    return CartProduct(
      genericMaterialName: genericMaterialName,
      itemRegistrationNumber: itemRegistrationNumber,
      materialDescription: materialDescription,
      materialNumber: MaterialNumber(materialNumber),
      parentID: parentID,
      productID: MaterialNumber(productID),
      quantity: quantity,
      taxClassification: taxClassification,
      therapeuticClass: therapeuticClass,
      type: MaterialItemType(type),
      price: Price.empty(),
    );
  }

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);
}
