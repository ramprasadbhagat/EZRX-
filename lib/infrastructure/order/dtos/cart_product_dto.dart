import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_details.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_material_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/bonus_sample_item_dto.dart';

part 'cart_product_dto.freezed.dart';
part 'cart_product_dto.g.dart';

@freezed
class CartProductDto with _$CartProductDto {
  const CartProductDto._();
  const factory CartProductDto({
    @JsonKey(name: 'productID', defaultValue: '') required String productID,
    @JsonKey(name: 'parentID', defaultValue: '') required String parentID,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'quantity', defaultValue: 0) required int quantity,
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
    @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
        required double counterOfferPrice,
    @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
        required double counterOfferDiscount,
    @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
        required String counterOfferCurrency,
    @JsonKey(name: 'comment', defaultValue: '') required String remarks,
    @Default(BundleDetailsDto.empty)
    @JsonKey(name: 'bundleDetails')
        BundleDetailsDto bundleDetails,
    @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
        required List<MaterialDto> bundleMaterials,
    @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
        required List<BonusSampleItemDto> bonusMaterials,
    @JsonKey(name: 'taxes', readValue: handleTax) required double tax,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'suspensionStatus', defaultValue: false)
        required bool isSuspended,
    @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
        required bool isPrincipalSuspended,
    @Default(PriceComboDealDto.empty)
    @JsonKey(name: 'comboDeals')
        PriceComboDealDto comboDeal,
    @JsonKey(name: 'comboMaterials', defaultValue: [])
        required List<ComboMaterialItemDto> comboMaterials,
    //maximumQty auto set to maximum limit if we get null from response
    @JsonKey(name: 'maximumQty', defaultValue: 99999) required int maximumQty,
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
      quantity: cartItemDetails.materialInfo.quantity.intValue,
      taxClassification:
          cartItemDetails.materialInfo.taxClassification.getOrDefaultValue(''),
      isFOCMaterial: cartItemDetails.materialInfo.isFOCMaterial,
      tax: cartItemDetails.materialInfo.tax,
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
      isSuspended: cartItemDetails.materialInfo.isSuspended,
      isPrincipalSuspended: cartItemDetails.materialInfo.isPrincipalSuspended,
      comboMaterials: [],
      comboDeal: PriceComboDealDto.empty,
      maximumQty: cartItemDetails.maximumQty,
    );
  }
  MaterialInfo get toMaterialInfo {
    return MaterialInfo.empty().copyWith(
      genericMaterialName: genericMaterialName,
      itemRegistrationNumber: itemRegistrationNumber,
      materialDescription: materialDescription,
      materialNumber: MaterialNumber(productID),
      parentID: parentID,
      quantity: MaterialQty(quantity),
      taxClassification: MaterialTaxClassification(taxClassification),
      isFOCMaterial: isFOCMaterial,
      tax: tax,
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
      isSuspended: isSuspended,
      isPrincipalSuspended: isPrincipalSuspended,
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
      comboMaterials: comboMaterials.map((e) => e.toDomain(comboDeal)).toList(),
      maximumQty: maximumQty,
    );
  }

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);
}

@freezed
class BundleDetailsDto with _$BundleDetailsDto {
  const BundleDetailsDto._();
  const factory BundleDetailsDto({
    @JsonKey(name: 'bundleName', defaultValue: '') required String bundleName,
    @JsonKey(name: 'bundleCode', defaultValue: '') required String bundleCode,
    @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
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
