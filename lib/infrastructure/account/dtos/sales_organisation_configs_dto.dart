import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_principal_dto.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_organisation_configs_dto.freezed.dart';
part 'sales_organisation_configs_dto.g.dart';

@freezed
class SalesOrganisationConfigsDto with _$SalesOrganisationConfigsDto {
  const SalesOrganisationConfigsDto._();

  const factory SalesOrganisationConfigsDto({
    @JsonKey(name: 'disableProcessingStatus')
        required bool disableProcessingStatus,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'hideCustomer', defaultValue: false)
        required bool hideCustomer,
    @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
        required bool enableGimmickMaterial,
    @JsonKey(name: 'disablePrincipals', defaultValue: false)
        required bool disablePrincipals,
    @JsonKey(name: 'principalList')
    @_PrincipalListConverter()
        required List<SalesOrganisationConfigsPrincipalDto> principalList,
    @JsonKey(name: 'disableOrderType', defaultValue: false)
        required bool disableOrderType,
    @JsonKey(name: 'enableBatchNumber', defaultValue: false)
        required bool enableBatchNumber,
    @JsonKey(name: 'disableBundles', defaultValue: false)
        required bool disableBundles,
    @JsonKey(name: 'enableZDP5', defaultValue: false) required bool enableZDP5,
    @JsonKey(name: 'enableTaxClassification', defaultValue: false)
        required bool enableTaxClassification,
    @JsonKey(name: 'enableVat', defaultValue: false) required bool enableVat,
    @JsonKey(name: 'vatValue', defaultValue: 0) required int vatValue,
    @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
        required bool materialWithoutPrice,
    @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
        required bool enableSpecialInstructions,
    @JsonKey(name: 'enableReferenceNote', defaultValue: false)
        required bool enableReferenceNote,
    @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
        required bool enableCollectiveNumber,
    @JsonKey(name: 'enableMobileNumber', defaultValue: false)
        required bool enableMobileNumber,
    @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
        required bool enableFutureDeliveryDay,
    @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
        required bool enablePOAttachmentRequired,
    @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
        required bool enablePaymentTerms,
    @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
        required String futureDeliveryDay,
    @JsonKey(name: 'enableGMC', defaultValue: false) required bool enableGMC,
    @JsonKey(name: 'enableListPrice', defaultValue: false)
        required bool enableListPrice,
    @JsonKey(name: 'enableDefaultMD', defaultValue: false)
        required bool enableDefaultMD,
    @JsonKey(name: 'priceOverride', defaultValue: false)
        required bool priceOverride,
    @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
        required bool disablePaymentTermsDisplay,
    @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
        required bool disableDeliveryDate,
    @JsonKey(name: 'enableBillTo', defaultValue: false)
        required bool enableBillTo,
    @JsonKey(name: 'showPOAttachment', defaultValue: false)
        required bool showPOAttachment,
    @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
        required bool expiryDateDisplay,
    @JsonKey(name: 'hideStockDisplay', defaultValue: false)
        required bool hideStockDisplay,
    @JsonKey(name: 'addOosMaterials', defaultValue: false)
        required bool addOosMaterials,
    @JsonKey(name: 'oosValue', defaultValue: 0) required int oosValue,
    @JsonKey(name: 'enableRemarks', defaultValue: false)
        required bool enableRemarks,
    @JsonKey(name: 'enableOHPrice', defaultValue: true)
        required bool enableOHPrice,
    @JsonKey(name: 'ponRequired', defaultValue: false)
        required bool poNumberRequired,
    @JsonKey(name: 'enableIRN', defaultValue: false) required bool enableIRN,
    @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
        required bool enableTaxDisplay,
    @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
        required bool enableTaxAtTotalLevelOnly,
    @JsonKey(name: 'netPriceOverride', defaultValue: false)
        required bool netPriceOverride,
    @JsonKey(name: 'batchNumDisplay', defaultValue: false)
        required bool batchNumDisplay,
    @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
        required bool displayOrderDiscount,
    @StringToDoubleConverter()
    @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
        required double minOrderAmount,
    @JsonKey(name: 'salesOrgCode', defaultValue: '0') required String salesOrg,
    @JsonKey(name: 'enableZDP8Override', defaultValue: false)
        required bool enableZDP8Override,
    @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
        required bool disableReturnsAccessSR,
    @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
        required bool disableReturnsAccess,
    @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
        required bool disableOverrideFieldCustomer,
    @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
        required bool disableOverrideFieldSR,
    @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
        required bool enableGreenDelivery,
    @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
        required int greenDeliveryDelayInDays,
    @JsonKey(name: 'enableComboDeals', defaultValue: false)
        required bool enableComboDeals,
    @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
        required int greenDeliveryUserRole,
    @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
        required int comboDealsUserRole,
    @JsonKey(name: 'enableGMN', defaultValue: false) required bool enableGMN,
    @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
        required bool displayItemTaxBreakdown,
    @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
        required bool displaySubtotalTaxBreakdown,
    @JsonKey(name: 'disablePayment', defaultValue: false)
        required bool disablePayment,
    @JsonKey(name: 'hideCredit', defaultValue: false) required bool hideCredit,
    @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
        required bool allowReturnsOutsidePolicy,
    @JsonKey(name: 'enableMarketPlace', defaultValue: false)
        required bool enableMarketPlace,
    @StringToDoubleConverter()
    @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
        required double mpMinOrderAmount,
    @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
        required bool statementOfAccountEnabled,
  }) = _SalesOrganisationConfigsDto;

  factory SalesOrganisationConfigsDto.fromDomain(
    SalesOrganisationConfigs configs,
  ) {
    return SalesOrganisationConfigsDto(
      salesOrg: configs.salesOrg.getOrDefaultValue(''),
      enableIRN: configs.enableIRN,
      enableDefaultMD: configs.enableDefaultMD,
      priceOverride: configs.priceOverride,
      disableProcessingStatus: configs.disableProcessingStatus,
      currency: configs.currency.getOrDefaultValue(''),
      hideCustomer: configs.hideCustomer,
      enableGimmickMaterial: configs.enableGimmickMaterial,
      disablePrincipals: configs.disablePrincipals,
      principalList: List.from(configs.principalList)
          .map((e) => SalesOrganisationConfigsPrincipalDto.fromDomain(e))
          .toList(),
      disableOrderType: configs.disableOrderType,
      enableBatchNumber: configs.enableBatchNumber,
      disableBundles: configs.disableBundles,
      enableZDP5: configs.enableZDP5,
      enableTaxClassification: configs.enableTaxClassification,
      enableVat: configs.enableVat,
      enableTaxAtTotalLevelOnly: configs.enableTaxAtTotalLevelOnly,
      enablePOAttachmentRequired: configs.enablePOAttachmentRequired,
      vatValue: configs.vatValue,
      materialWithoutPrice: configs.materialWithoutPrice,
      enableSpecialInstructions: configs.enableSpecialInstructions,
      enableReferenceNote: configs.enableReferenceNote,
      enableCollectiveNumber: configs.enableCollectiveNumber,
      enableMobileNumber: configs.enableMobileNumber,
      enableFutureDeliveryDay: configs.enableFutureDeliveryDay,
      enablePaymentTerms: configs.enablePaymentTerms,
      futureDeliveryDay: configs.futureDeliveryDay.getOrDefaultValue(''),
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
      addOosMaterials: configs.addOosMaterials.getOrDefaultValue(false),
      oosValue: configs.oosValue.getOrDefaultValue(0),
      enableRemarks: configs.enableRemarks,
      enableOHPrice: configs.enableOHPrice,
      poNumberRequired: configs.poNumberRequired.getOrCrash(),
      enableTaxDisplay: configs.enableTaxDisplay,
      netPriceOverride: configs.netPriceOverride,
      batchNumDisplay: configs.batchNumDisplay,
      displayOrderDiscount: configs.displayOrderDiscount,
      minOrderAmount: configs.minOrderAmount,
      enableZDP8Override: configs.enableZDP8Override,
      disableReturnsAccessSR: configs.disableReturnsAccessSR,
      disableOverrideFieldSR: configs.disableOverrideFieldSR,
      disableOverrideFieldCustomer: configs.disableOverrideFieldCustomer,
      disableReturnsAccess: configs.disableReturnsAccess,
      enableComboDeals: configs.enableComboDeals,
      comboDealsUserRole: configs.comboDealsUserRole.getOrDefaultValue(0),
      enableGMN: configs.enableGMN,
      displayItemTaxBreakdown: configs.displayItemTaxBreakdown,
      displaySubtotalTaxBreakdown: configs.displaySubtotalTaxBreakdown,
      disablePayment: configs.disablePayment,
      hideCredit: configs.hideCredit,
      allowReturnsOutsidePolicy: configs.allowReturnsOutsidePolicy,
      enableMarketPlace: configs.enableMarketPlace,
      mpMinOrderAmount: configs.mpMinOrderAmount,
      statementOfAccountEnabled: configs.statementOfAccountEnabled,
    );
  }

  SalesOrganisationConfigs toDomain() {
    return SalesOrganisationConfigs(
      salesOrg: SalesOrg(salesOrg),
      enableIRN: enableIRN,
      enableDefaultMD: enableDefaultMD,
      disableProcessingStatus: disableProcessingStatus,
      currency: Currency(currency),
      hideCustomer: hideCustomer,
      enableGimmickMaterial: enableGimmickMaterial,
      disablePrincipals: disablePrincipals,
      principalList: principalList.map((e) => e.toDomain()).toList(),
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
      enablePOAttachmentRequired: enablePOAttachmentRequired,
      enableCollectiveNumber: enableCollectiveNumber,
      enableMobileNumber: enableMobileNumber,
      enableFutureDeliveryDay: enableFutureDeliveryDay,
      enablePaymentTerms: enablePaymentTerms,
      futureDeliveryDay: FutureDeliveryDay(futureDeliveryDay),
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
      addOosMaterials: OosMaterial(addOosMaterials),
      oosValue: OosValue(oosValue),
      enableRemarks: enableRemarks,
      enableOHPrice: enableOHPrice,
      poNumberRequired: PoNumberRequired(poNumberRequired),
      enableTaxDisplay: enableTaxDisplay,
      netPriceOverride: netPriceOverride,
      batchNumDisplay: batchNumDisplay,
      displayOrderDiscount: displayOrderDiscount,
      minOrderAmount: minOrderAmount,
      enableZDP8Override: enableZDP8Override,
      disableReturnsAccessSR: disableReturnsAccessSR,
      disableReturnsAccess: disableReturnsAccess,
      disableOverrideFieldCustomer: disableOverrideFieldCustomer,
      disableOverrideFieldSR: disableOverrideFieldSR,
      enableComboDeals: enableComboDeals,
      comboDealsUserRole: ComboDealUserRole(comboDealsUserRole),
      enableGMN: enableGMN,
      displayItemTaxBreakdown: displayItemTaxBreakdown,
      displaySubtotalTaxBreakdown: displaySubtotalTaxBreakdown,
      disablePayment: disablePayment,
      hideCredit: hideCredit,
      allowReturnsOutsidePolicy: allowReturnsOutsidePolicy,
      enableMarketPlace: enableMarketPlace,
      mpMinOrderAmount: mpMinOrderAmount,
      statementOfAccountEnabled: statementOfAccountEnabled,
    );
  }

  factory SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrganisationConfigsDtoFromJson(json);
}

class _PrincipalListConverter extends JsonConverter<
    List<SalesOrganisationConfigsPrincipalDto>, Map<String, dynamic>> {
  const _PrincipalListConverter();

  //======================================================================
  // Response give an extra 'value' level that no useful on our DTO and Entity
  // We use this way to remove it
  //
  //======================================================================

  @override
  List<SalesOrganisationConfigsPrincipalDto> fromJson(
    Map<String, dynamic> json,
  ) {
    return List.from(json['value'])
        .map((e) => SalesOrganisationConfigsPrincipalDto.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson(
    List<SalesOrganisationConfigsPrincipalDto> object,
  ) {
    return {
      'value': object
          .map((e) => {'date': e.date, 'principal': e.principalCode})
          .toList(),
    };
  }
}
