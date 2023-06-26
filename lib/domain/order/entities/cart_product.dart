import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product.freezed.dart';

@freezed
class CartProduct with _$CartProduct {
  const CartProduct._();

  const factory CartProduct({
    required MaterialNumber productID,
    required String parentID,
    required MaterialItemType type,
    required int quantity,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String therapeuticClass,
    required String taxClassification,
    required String itemRegistrationNumber,
    required String genericMaterialName,
  }) = _CartProduct;

  factory CartProduct.empty() => CartProduct(
       genericMaterialName: '',
       itemRegistrationNumber: '',
       materialDescription: '',
       materialNumber: MaterialNumber(''),
       parentID: '',
       productID: MaterialNumber(''),
       quantity: 0,
       taxClassification: '',
       therapeuticClass: '',
       type: MaterialItemType(''),
      );
}
