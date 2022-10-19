import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();
  const factory CartItemDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'type', defaultValue: '') required String materialType,
    @JsonKey(name: 'qty', defaultValue: 0) required int materialQuantity,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'taxClassification', defaultValue: '')
        required String taxClassification,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
  }) = _CartItemDto;

  factory CartItemDto.fromDomain(CartItem orderTemplateInfo) {
    return CartItemDto(
      materialNumber: orderTemplateInfo.materialNumber.getOrCrash(),
      materialQuantity: orderTemplateInfo.materialQuantity,
      materialDescription: orderTemplateInfo.materialDescription,
      materialType: orderTemplateInfo.materialType,
      principalName: orderTemplateInfo.principalName.getOrCrash(),
      taxClassification: orderTemplateInfo.taxClassification,
      hidePrice: orderTemplateInfo.hidePrice,
      hasValidTenderContract: orderTemplateInfo.hasValidTenderContract,
    );
  }

  CartItem toDomain() {
    return CartItem(
      materialNumber: MaterialNumber(materialNumber),
      materialQuantity: materialQuantity,
      materialDescription: materialDescription,
      materialType: materialType,
      principalName: PrincipalName(principalName),
      taxClassification: taxClassification,
      hidePrice: hidePrice,
      hasValidTenderContract: hasValidTenderContract,
    );
  }

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);
}
