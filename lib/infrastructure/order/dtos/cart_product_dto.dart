import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_details.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/bonus_sample_item_dto.dart';

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
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
        required bool isFOCMaterial,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
        required String genericMaterialName,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'principalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'CounterOfferPrice', defaultValue: 0)
        required double counterOfferPrice,
    @JsonKey(name: 'DiscountOverridePercentage', defaultValue: 0)
        required double counterOfferDiscount,
    @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
        required String counterOfferCurrency,
    @JsonKey(name: 'Comment', defaultValue: '') required String remarks,
    @Default(BundleDetailsDto.empty)
    @JsonKey(name: 'BundleDetails')
        BundleDetailsDto bundleDetails,
    @JsonKey(name: 'BundleMaterials', defaultValue: <MaterialDto>[])
        required List<MaterialDto> bundleMaterials,
    @JsonKey(name: 'BonusMaterials', defaultValue: <BonusSampleItemDto>[])
        required List<BonusSampleItemDto> bonusMaterials,
    @JsonKey(name: 'taxes', defaultValue: <String>[])
        required List<String> taxes,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
  }) = _CartProductDto;
  factory CartProductDto.fromDomain(
    PriceAggregate cartItemDetails,
  ) {
    return CartProductDto(
      genericMaterialName: cartItemDetails.materialInfo.genericMaterialName,
      itemRegistrationNumber:
          cartItemDetails.materialInfo.itemRegistrationNumber,
      materialDescription: cartItemDetails.materialInfo.materialDescription,
      materialNumber: cartItemDetails.materialInfo.materialNumber.getOrCrash(),
      parentID: cartItemDetails.materialInfo.parentID,
      productID: cartItemDetails.materialInfo.materialNumber.getOrCrash(),
      quantity: cartItemDetails.materialInfo.quantity,
      taxClassification:
          cartItemDetails.materialInfo.taxClassification.getOrDefaultValue(''),
      isFOCMaterial: cartItemDetails.materialInfo.isFOCMaterial,
      taxes: cartItemDetails.materialInfo.taxes,
      therapeuticClass: cartItemDetails.materialInfo.therapeuticClass,
      type: cartItemDetails.materialInfo.type.getOrCrash(),
      principalName: cartItemDetails.materialInfo.principalData.principalName
          .getOrDefaultValue(''),
      principalCode:
          cartItemDetails.materialInfo.principalData.principalCode.getOrCrash(),
      remarks: cartItemDetails.materialInfo.remarks,
      counterOfferCurrency: cartItemDetails
          .materialInfo.counterOfferDetails.counterOfferCurrency
          .getOrDefaultValue(''),
      counterOfferPrice: cartItemDetails
          .materialInfo.counterOfferDetails.counterOfferPrice.doubleValue,
      counterOfferDiscount: cartItemDetails.materialInfo.counterOfferDetails
          .discountOverridePercentage.doubleValue,
      bundleDetails: BundleDetailsDto.fromDomain(
        BundleDetails(
          bundleCode: cartItemDetails.bundle.bundleCode,
          bundleName: cartItemDetails.bundle.bundleName.getValue(),
          bundleInformation: cartItemDetails.bundle.bundleInformation,
        ),
      ),
      bundleMaterials: (cartItemDetails.bundle.materials)
          .map((e) => MaterialDto.fromDomain(e))
          .toList(),
      bonusMaterials: cartItemDetails.bonusSampleItems
          .map((e) => BonusSampleItemDto.fromDomain(e))
          .toList(),
      hidePrice: cartItemDetails.materialInfo.hidePrice,
    );
  }
  MaterialInfo get toMaterialInfo {
    return MaterialInfo.empty().copyWith(
      genericMaterialName: genericMaterialName,
      itemRegistrationNumber: itemRegistrationNumber,
      materialDescription: materialDescription,
      materialNumber: MaterialNumber(productID),
      parentID: parentID,
      quantity: quantity,
      taxClassification: MaterialTaxClassification(taxClassification),
      isFOCMaterial: isFOCMaterial,
      taxes: taxes,
      hidePrice: hidePrice,
      therapeuticClass: therapeuticClass,
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
        comment: StringValue(remarks),
        counterOfferCurrency: Currency(counterOfferCurrency),
        counterOfferPrice: CounterOfferValue(counterOfferPrice.toString()),
        discountOverridePercentage:
            CounterOfferDiscountValue(counterOfferDiscount.toString()),
      ),
      type: MaterialInfoType(type),
      remarks: remarks,
    );
  }

  PriceAggregate get toDomain {
    return PriceAggregate.empty().copyWith(
      materialInfo: toMaterialInfo,
      bundle: Bundle.empty().copyWith(
        bundleCode: bundleDetails.bundleCode,
        bundleName: BundleName(bundleDetails.bundleName),
        bundleInformation:
            bundleDetails.bundleInfo.map((e) => e.toDomain()).toList(),
        materials: bundleMaterials.map((e) => e.toDomain()).toList(),
      ),
      quantity: quantity,
      bonusSampleItems: bonusMaterials.map((e) => e.toDomain()).toList(),
    );
  }

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);
}

@freezed
class BundleDetailsDto with _$BundleDetailsDto {
  const BundleDetailsDto._();
  const factory BundleDetailsDto({
    @JsonKey(name: 'BundleName', defaultValue: '') required String bundleName,
    @JsonKey(name: 'BundleCode', defaultValue: '') required String bundleCode,
    @JsonKey(name: 'BundleInformation', defaultValue: <BundleInfoDto>[])
        required List<BundleInfoDto> bundleInfo,
  }) = _BundleDetailsDto;
  factory BundleDetailsDto.fromDomain(
    BundleDetails bundleDetails,
  ) {
    return BundleDetailsDto(
      bundleName: bundleDetails.bundleName,
      bundleCode: bundleDetails.bundleCode,
      bundleInfo: bundleDetails.bundleInformation
          .map((e) => BundleInfoDto.fromDomain(e))
          .toList(),
    );
  }

  static const BundleDetailsDto empty = BundleDetailsDto(
    bundleName: '',
    bundleCode: '',
    bundleInfo: <BundleInfoDto>[],
  );

  BundleDetails get toDomain {
    return BundleDetails.empty().copyWith(
      bundleName: bundleName,
      bundleCode: bundleCode,
      bundleInformation: bundleInfo.map((e) => e.toDomain()).toList(),
    );
  }

  factory BundleDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$BundleDetailsDtoFromJson(json);
}
