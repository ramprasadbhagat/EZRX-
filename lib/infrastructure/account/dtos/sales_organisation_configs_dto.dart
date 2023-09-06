import 'dart:ui';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_principal_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'sales_organisation_configs_dto.freezed.dart';
part 'sales_organisation_configs_dto.g.dart';

@freezed
class SalesOrganisationConfigsDto with _$SalesOrganisationConfigsDto {
  const SalesOrganisationConfigsDto._();

  @HiveType(typeId: 5, adapterName: 'SalesOrganisationConfigsDtoAdapter')
  const factory SalesOrganisationConfigsDto({
    @JsonKey(name: 'disableProcessingStatus')
    @HiveField(100, defaultValue: false)
        required bool disableProcessingStatus,
    @JsonKey(name: 'currency')
    @HiveField(101, defaultValue: '')
        required String currency,
    @JsonKey(name: 'hideCustomer', defaultValue: false)
    @HiveField(102, defaultValue: false)
        required bool hideCustomer,
    @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
    @HiveField(103, defaultValue: false)
        required bool enableGimmickMaterial,
    @JsonKey(name: 'languageFilter', defaultValue: false)
    @HiveField(104, defaultValue: false)
        required bool languageFilter,
    @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
    @HiveField(105, defaultValue: ApiLanguageCode.english)
        required String languageValue,
    @JsonKey(name: 'disablePrincipals', defaultValue: false)
    @HiveField(106, defaultValue: false)
        required bool disablePrincipals,
    @JsonKey(name: 'principalList')
    @_PrincipalListConverter()
    @HiveField(7, defaultValue: [])
        required List<SalesOrganisationConfigsPrincipalDto> principalList,
    @JsonKey(name: 'disableOrderType', defaultValue: false)
    @HiveField(108, defaultValue: false)
        required bool disableOrderType,
    @JsonKey(name: 'enableBatchNumber', defaultValue: false)
    @HiveField(109, defaultValue: false)
        required bool enableBatchNumber,
    @JsonKey(name: 'disableBundles', defaultValue: false)
    @HiveField(110, defaultValue: false)
        required bool disableBundles,
    @JsonKey(name: 'enableZDP5', defaultValue: false)
    @HiveField(111, defaultValue: false)
        required bool enableZDP5,
    @JsonKey(name: 'enableTaxClassification', defaultValue: false)
    @HiveField(112, defaultValue: false)
        required bool enableTaxClassification,
    @JsonKey(name: 'enableVat', defaultValue: false)
    @HiveField(113, defaultValue: false)
        required bool enableVat,
    @JsonKey(name: 'vatValue', defaultValue: 0)
    @HiveField(114, defaultValue: 0)
        required int vatValue,
    @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
    @HiveField(115, defaultValue: false)
        required bool materialWithoutPrice,
    @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
    @HiveField(116, defaultValue: false)
        required bool enableSpecialInstructions,
    @JsonKey(name: 'enableReferenceNote', defaultValue: false)
    @HiveField(117, defaultValue: false)
        required bool enableReferenceNote,
    @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
    @HiveField(118, defaultValue: false)
        required bool enableCollectiveNumber,
    @JsonKey(name: 'enableMobileNumber', defaultValue: false)
    @HiveField(119, defaultValue: false)
        required bool enableMobileNumber,
    @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
    @HiveField(120, defaultValue: false)
        required bool enableFutureDeliveryDay,
    @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
    @HiveField(121, defaultValue: false)
        required bool enablePaymentTerms,
    @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
    @HiveField(122, defaultValue: '')
        required String futureDeliveryDay,
    @JsonKey(name: 'enableGMC', defaultValue: false)
    @HiveField(123, defaultValue: false)
        required bool enableGMC,
    @JsonKey(name: 'enableListPrice', defaultValue: false)
    @HiveField(124, defaultValue: false)
        required bool enableListPrice,
    @JsonKey(name: 'enableDefaultMD', defaultValue: false)
    @HiveField(125, defaultValue: false)
        required bool enableDefaultMD,
    @JsonKey(name: 'priceOverride', defaultValue: false)
    @HiveField(126, defaultValue: false)
        required bool priceOverride,
    @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
    @HiveField(127, defaultValue: false)
        required bool disablePaymentTermsDisplay,
    @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
    @HiveField(128, defaultValue: false)
        required bool disableDeliveryDate,
    @JsonKey(name: 'enableBillTo', defaultValue: false)
    @HiveField(129, defaultValue: false)
        required bool enableBillTo,
    @JsonKey(name: 'showPOAttachment', defaultValue: false)
    @HiveField(130, defaultValue: false)
        required bool showPOAttachment,
    @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
    @HiveField(131, defaultValue: false)
        required bool expiryDateDisplay,
    @JsonKey(name: 'hideStockDisplay', defaultValue: false)
    @HiveField(132, defaultValue: false)
        required bool hideStockDisplay,
    @JsonKey(name: 'addOosMaterials', defaultValue: false)
    @HiveField(133, defaultValue: false)
        required bool addOosMaterials,
    @JsonKey(name: 'oosValue', defaultValue: 0)
    @HiveField(134, defaultValue: 0)
        required int oosValue,
    @JsonKey(name: 'enableRemarks', defaultValue: false)
    @HiveField(135, defaultValue: false)
        required bool enableRemarks,
    @JsonKey(name: 'enableOHPrice', defaultValue: true)
    @HiveField(136, defaultValue: true)
        required bool enableOHPrice,
    @JsonKey(name: 'ponRequired', defaultValue: false)
    @HiveField(137, defaultValue: false)
        required bool poNumberRequired,
    @JsonKey(name: 'enableIRN', defaultValue: false)
    @HiveField(138, defaultValue: false)
        required bool enableIRN,
    @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
    @HiveField(139, defaultValue: false)
        required bool enableTaxDisplay,
    @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
    @HiveField(140, defaultValue: false)
        required bool enableTaxAtTotalLevelOnly,
    @JsonKey(name: 'netPriceOverride', defaultValue: false)
    @HiveField(141, defaultValue: false)
        required bool netPriceOverride,
    @JsonKey(name: 'batchNumDisplay', defaultValue: false)
    @HiveField(142, defaultValue: false)
        required bool batchNumDisplay,
    @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
    @HiveField(143, defaultValue: false)
        required bool displayOrderDiscount,
    @JsonKey(name: 'minOrderAmount', defaultValue: '0')
    @HiveField(144, defaultValue: '0')
        required String minOrderAmount,
    @JsonKey(name: 'salesOrgCode', defaultValue: '0')
    @HiveField(145, defaultValue: '0')
        required String salesOrg,
    @JsonKey(name: 'enableZDP8Override', defaultValue: false)
    @HiveField(146, defaultValue: false)
        required bool enableZDP8Override,
    @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
    @HiveField(147, defaultValue: false)
        required bool disableReturnsAccessSR,
    @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
    @HiveField(148, defaultValue: false)
        required bool disableReturnsAccess,
    @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
    @HiveField(149, defaultValue: false)
        required bool enableGreenDelivery,
    @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
    @HiveField(150, defaultValue: 2)
        required int greenDeliveryDelayInDays,
    @JsonKey(name: 'enableComboDeals', defaultValue: false)
    @HiveField(151, defaultValue: false)
        required bool enableComboDeals,
    @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
    @HiveField(152, defaultValue: 0)
        required int greenDeliveryUserRole,
    @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
    @HiveField(153, defaultValue: 0)
        required int comboDealsUserRole,
    @JsonKey(name: 'enableGMN', defaultValue: false)
    @HiveField(154, defaultValue: false)
        required bool enableGMN,
    @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
    @HiveField(155, defaultValue: false)
        required bool displayItemTaxBreakdown,
    @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
    @HiveField(156, defaultValue: false)
        required bool displaySubtotalTaxBreakdown,
    @JsonKey(name: 'disablePayment', defaultValue: false)
    @HiveField(157, defaultValue: false)
        required bool disablePayment,
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
      languageFilter: configs.languageFilter,
      languageValue: configs.languageValue.languageCode,
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
      poNumberRequired: configs.poNumberRequired,
      enableTaxDisplay: configs.enableTaxDisplay,
      netPriceOverride: configs.netPriceOverride,
      batchNumDisplay: configs.batchNumDisplay,
      displayOrderDiscount: configs.displayOrderDiscount,
      minOrderAmount: configs.minOrderAmount,
      enableZDP8Override: configs.enableZDP8Override,
      disableReturnsAccessSR: configs.disableReturnsAccessSR,
      disableReturnsAccess: configs.disableReturnsAccess,
      enableComboDeals: configs.enableComboDeals,
      comboDealsUserRole: configs.comboDealsUserRole.getOrDefaultValue(0),
      enableGMN: configs.enableGMN,
      displayItemTaxBreakdown: configs.displayItemTaxBreakdown,
      displaySubtotalTaxBreakdown: configs.displaySubtotalTaxBreakdown,
      disablePayment: configs.disablePayment,
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
      languageFilter: languageFilter,
      languageValue: Locale(
        languageValue,
      ),
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
      poNumberRequired: poNumberRequired,
      enableTaxDisplay: enableTaxDisplay,
      netPriceOverride: netPriceOverride,
      batchNumDisplay: batchNumDisplay,
      displayOrderDiscount: displayOrderDiscount,
      minOrderAmount: minOrderAmount,
      enableZDP8Override: enableZDP8Override,
      disableReturnsAccessSR: disableReturnsAccessSR,
      disableReturnsAccess: disableReturnsAccess,
      enableComboDeals: enableComboDeals,
      comboDealsUserRole: ComboDealUserRole(comboDealsUserRole),
      enableGMN: enableGMN,
      displayItemTaxBreakdown: displayItemTaxBreakdown,
      displaySubtotalTaxBreakdown: displaySubtotalTaxBreakdown,
      disablePayment: disablePayment,
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

String handleEmptyLanguageValue(Map json, String key) {
  final String languageValue = json[key] ?? '';

  return languageValue.isNotEmpty ? languageValue : ApiLanguageCode.english;
}
