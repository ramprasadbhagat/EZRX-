import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_sales_organisation_configs_dto.freezed.dart';
part 'update_sales_organisation_configs_dto.g.dart';

@freezed
class UpdateSalesOrganisationConfigsDto
    with _$UpdateSalesOrganisationConfigsDto {
  const UpdateSalesOrganisationConfigsDto._();

  const factory UpdateSalesOrganisationConfigsDto({
    @JsonKey(name: 'salesOrgCode', defaultValue: '0') required String salesOrg,
    @JsonKey(name: 'ponRequired', defaultValue: false)
        required bool poNumberRequired,
    @JsonKey(name: 'priceOverride', defaultValue: false)
        required bool priceOverride,
    @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
        required bool expiryDateDisplay,
    @JsonKey(name: 'batchNumDisplay', defaultValue: false)
        required bool batchNumDisplay,
    @JsonKey(name: 'enableBatchNumber', defaultValue: false)
        required bool enableBatchNumber,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'netPriceOverride', defaultValue: false)
        required bool netPriceOverride,
    @JsonKey(name: 'languageFilter', defaultValue: false)
        required bool languageFilter,
    @JsonKey(name: 'enableVat', defaultValue: false) required bool enableVat,
    @JsonKey(name: 'enableZDP5', defaultValue: false) required bool enableZDP5,
    @JsonKey(name: 'languageValue', defaultValue: '')
        required String languageValue,
    @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
        required bool materialWithoutPrice,
    @JsonKey(name: 'enableZDP8Override', defaultValue: false)
        required bool enableZDP8Override,
    @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
        required bool displayOrderDiscount,
    @JsonKey(name: 'enableIRN', defaultValue: false) required bool enableIRN,
    @JsonKey(name: 'enableTaxClassification', defaultValue: false)
        required bool enableTaxClassification,
    @JsonKey(name: 'disableBundles', defaultValue: false)
        required bool disableBundles,
    @JsonKey(name: 'disableProcessingStatus')
        required bool disableProcessingStatus,
    @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
        required bool enableCollectiveNumber,
    @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
        required bool enableGimmickMaterial,
    @JsonKey(name: 'hideStockDisplay', defaultValue: false)
        required bool hideStockDisplay,
    @JsonKey(name: 'showPOAttachment', defaultValue: false)
        required bool showPOAttachment,
    @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
        required bool disableDeliveryDate,
    @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
        required bool enableTaxAtTotalLevelOnly,
    @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
        required bool enableGreenDelivery,
    @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
        required int greenDeliveryDelayInDays,
    @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
        required int greenDeliveryUserRole,
    @JsonKey(name: 'minOrderAmount', defaultValue: '0')
        required String minOrderAmount,
    @JsonKey(name: 'hideCustomer', defaultValue: false)
        required bool hideCustomer,
    @JsonKey(name: 'disableOrderType', defaultValue: false)
        required bool disableOrderType,
    @JsonKey(name: 'vatValue', defaultValue: 0) required int vatValue,
    @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
        required bool enableSpecialInstructions,
    @JsonKey(name: 'enableReferenceNote', defaultValue: false)
        required bool enableReferenceNote,
    @JsonKey(name: 'enableMobileNumber', defaultValue: false)
        required bool enableMobileNumber,
    @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
        required bool enablePaymentTerms,
    @JsonKey(name: 'enableGMC', defaultValue: false) required bool enableGMC,
    @JsonKey(name: 'enableListPrice', defaultValue: false)
        required bool enableListPrice,
    @JsonKey(name: 'enableDefaultMD', defaultValue: false)
        required bool enableDefaultMD,
    @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
        required bool disablePaymentTermsDisplay,
    @JsonKey(name: 'enableBillTo', defaultValue: false)
        required bool enableBillTo,
    @JsonKey(name: 'enableOHPrice', defaultValue: true)
        required bool enableOHPrice,
    @JsonKey(name: 'addOosMaterials', defaultValue: false)
        required bool addOosMaterials,
    @JsonKey(name: 'oosValue', defaultValue: 0) required int oosValue,
    @JsonKey(name: 'enableRemarks', defaultValue: false)
        required bool enableRemarks,
    @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
        required bool enableTaxDisplay,
    @JsonKey(name: 'enableGMN', defaultValue: false) required bool enableGMN,
  }) = _UpdateSalesOrganisationConfigsDto;

  factory UpdateSalesOrganisationConfigsDto.fromDomain(
    UpdateSalesOrganisationConfigs configs,
  ) {
    return UpdateSalesOrganisationConfigsDto(
      salesOrg: configs.salesOrg.getOrDefaultValue(''),
      enableIRN: configs.enableIRN,
      enableDefaultMD: configs.enableDefaultMD,
      priceOverride: configs.priceOverride,
      batchNumDisplay: configs.batchNumDisplay,
      disableProcessingStatus: configs.disableProcessingStatus,
      currency: configs.currency.getOrDefaultValue(''),
      hideCustomer: configs.hideCustomer,
      enableGimmickMaterial: configs.enableGimmickMaterial,
      languageFilter: configs.languageFilter,
      languageValue: configs.languageValue.getOrDefaultValue(''),
      disableOrderType: configs.disableOrderType,
      enableBatchNumber: configs.enableBatchNumber,
      disableBundles: configs.disableBundles,
      enableZDP5: configs.enableZDP5,
      enableTaxClassification: configs.enableTaxClassification,
      enableVat: configs.enableVat,
      enableTaxAtTotalLevelOnly: configs.enableTaxAtTotalLevelOnly,
      vatValue: configs.vatValue,
      materialWithoutPrice: configs.materialWithoutPrice,
      enableSpecialInstructions: configs.enableSpecialInstructions,
      enableReferenceNote: configs.enableReferenceNote,
      enableCollectiveNumber: configs.enableCollectiveNumber,
      enableMobileNumber: configs.enableMobileNumber,
      enablePaymentTerms: configs.enablePaymentTerms,
      enableGMC: configs.enableGMC,
      enableListPrice: configs.enableListPrice,
      enableGreenDelivery: configs.enableGreenDelivery,
      greenDeliveryDelayInDays: configs.greenDeliveryDelayInDays,
      greenDeliveryUserRole: configs.greenDeliveryUserRole.getOrCrash(),
      disablePaymentTermsDisplay: configs.disablePaymentTermsDisplay,
      disableDeliveryDate: configs.disableDeliveryDate,
      enableBillTo: configs.enableBillTo,
      showPOAttachment: configs.showPOAttachment,
      hideStockDisplay: configs.hideStockDisplay,
      expiryDateDisplay: configs.expiryDateDisplay,
      addOosMaterials: configs.addOosMaterials,
      oosValue: configs.oosValue.getOrDefaultValue(0),
      enableRemarks: configs.enableRemarks,
      enableOHPrice: configs.enableOHPrice,
      poNumberRequired: configs.poNumberRequired,
      enableTaxDisplay: configs.enableTaxDisplay,
      netPriceOverride: configs.netPriceOverride,
      displayOrderDiscount: configs.displayOrderDiscount,
      minOrderAmount: configs.minOrderAmount,
      enableZDP8Override: configs.enableZDP8Override,
      enableGMN: configs.enableGMN,
    );
  }

  UpdateSalesOrganisationConfigs toDomain() {
    return UpdateSalesOrganisationConfigs(
      salesOrg: SalesOrg(salesOrg),
      enableIRN: enableIRN,
      enableDefaultMD: enableDefaultMD,
      disableProcessingStatus: disableProcessingStatus,
      batchNumDisplay: batchNumDisplay,
      currency: Currency(currency),
      hideCustomer: hideCustomer,
      enableGimmickMaterial: enableGimmickMaterial,
      languageFilter: languageFilter,
      languageValue: LanguageValue(languageValue),
      disableOrderType: disableOrderType,
      enableBatchNumber: enableBatchNumber,
      disableBundles: disableBundles,
      enableZDP5: enableZDP5,
      enableTaxClassification: enableTaxClassification,
      enableVat: enableVat,
      enableTaxAtTotalLevelOnly: enableTaxAtTotalLevelOnly,
      vatValue: vatValue,
      materialWithoutPrice: materialWithoutPrice,
      enableSpecialInstructions: enableSpecialInstructions,
      enableReferenceNote: enableReferenceNote,
      enableCollectiveNumber: enableCollectiveNumber,
      enableMobileNumber: enableMobileNumber,
      enablePaymentTerms: enablePaymentTerms,
      enableGMC: enableGMC,
      enableListPrice: enableListPrice,
      enableGreenDelivery: enableGreenDelivery,
      greenDeliveryDelayInDays: greenDeliveryDelayInDays,
      greenDeliveryUserRole: GreenDeliveryUserRole(greenDeliveryUserRole),
      priceOverride: priceOverride,
      disablePaymentTermsDisplay: disablePaymentTermsDisplay,
      disableDeliveryDate: disableDeliveryDate,
      enableBillTo: enableBillTo,
      showPOAttachment: showPOAttachment,
      hideStockDisplay: hideStockDisplay,
      expiryDateDisplay: expiryDateDisplay,
      addOosMaterials: addOosMaterials,
      oosValue: OosValue(oosValue),
      enableRemarks: enableRemarks,
      enableOHPrice: enableOHPrice,
      poNumberRequired: poNumberRequired,
      enableTaxDisplay: enableTaxDisplay,
      netPriceOverride: netPriceOverride,
      displayOrderDiscount: displayOrderDiscount,
      minOrderAmount: minOrderAmount,
      enableZDP8Override: enableZDP8Override,
      enableGMN: enableGMN,
    );
  }

  factory UpdateSalesOrganisationConfigsDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UpdateSalesOrganisationConfigsDtoFromJson(json);
}
