import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
        required String therapeuticClass,
    @JsonKey(name: 'taxClassification', defaultValue: '')
        required String taxClassification,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
        required String genericMaterialName,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'CounterOfferPrice', defaultValue: 0)
        required double counterOfferPrice,
    @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
        required String counterOfferCurrency,
    @JsonKey(name: 'Comment', defaultValue: '') required String comment,
  }) = _CartProductDto;
  factory CartProductDto.fromDomain(
    MaterialInfo cartItemDetails,
  ) {
    return CartProductDto(
      genericMaterialName: cartItemDetails.genericMaterialName,
      itemRegistrationNumber: cartItemDetails.itemRegistrationNumber,
      materialDescription: cartItemDetails.materialDescription,
      materialNumber: cartItemDetails.materialNumber.getOrCrash(),
      parentID: cartItemDetails.parentID,
      productID: cartItemDetails.materialNumber.getOrCrash(),
      quantity: cartItemDetails.quantity,
      taxClassification:
          cartItemDetails.taxClassification.getOrDefaultValue(''),
      therapeuticClass: cartItemDetails.therapeuticClass,
      type: cartItemDetails.type.getOrCrash(),
      principalName:
          cartItemDetails.principalData.principalName.getOrDefaultValue(''),
      comment:
          cartItemDetails.counterOfferDetails.comment.getOrDefaultValue(''),
      counterOfferCurrency: cartItemDetails
          .counterOfferDetails.counterOfferCurrency
          .getOrDefaultValue(''),
      counterOfferPrice: cartItemDetails
          .counterOfferDetails.counterOfferPrice.counterOfferValue,
    );
  }
  MaterialInfo get toDomain {
    return MaterialInfo.empty().copyWith(
      genericMaterialName: genericMaterialName,
      itemRegistrationNumber: itemRegistrationNumber,
      materialDescription: materialDescription,
      materialNumber: MaterialNumber(materialNumber),
      parentID: parentID,
      quantity: quantity,
      taxClassification: MaterialTaxClassification(taxClassification),
      therapeuticClass: therapeuticClass,
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(principalName),
      ),
      itemType: MaterialItemType(type),
      counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
        comment: StringValue(comment),
        counterOfferCurrency: Currency(counterOfferCurrency),
        counterOfferPrice: CounterOfferValue(counterOfferPrice.toString()),
      ),
    );
  }

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);
}
