import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String materialType,
    required int materialQuantity,
    required PrincipalName principalName,
    required String taxClassification,
    required bool hidePrice,
    required bool hasValidTenderContract,
  }) = _CartItem;

  factory CartItem.empty() => CartItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        materialType: '',
        materialQuantity: 0,
        principalName: PrincipalName(''),
        taxClassification: '',
        hidePrice: false,
        hasValidTenderContract: false,
      );
}
