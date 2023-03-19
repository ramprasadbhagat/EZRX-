import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_configs.freezed.dart';

@freezed
class SalesOrganisationConfigs with _$SalesOrganisationConfigs {
  const SalesOrganisationConfigs._();

  const factory SalesOrganisationConfigs({
    required bool enableIRN,
    required bool enableDefaultMD,
    required bool disableProcessingStatus,
    required Currency currency,
    required bool hideCustomer,
    required bool enableGimmickMaterial,
    required bool languageFilter,
    required LanguageValue languageValue,
    required bool disablePrincipals,
    required List principalList,
    required bool disableOrderType,
    required bool enableBatchNumber,
    required bool disableBundles,
    required bool enableZDP5,
    required bool enableVat,
    required bool enableTaxAtTotalLevelOnly,
    required bool enableTaxClassification,
    required int vatValue,
    required bool materialWithoutPrice,
    required bool enableSpecialInstructions,
    required bool enableReferenceNote,
    required bool enableCollectiveNumber,
    required bool enableMobileNumber,
    required bool enableFutureDeliveryDay,
    required bool enablePaymentTerms,
    required FutureDeliveryDay futureDeliveryDay,
    required bool enableGMC,
    required bool enableListPrice,
    required bool priceOverride,
    required bool disablePaymentTermsDisplay,
    required bool disableDeliveryDate,
    required bool enableBillTo,
    required bool enableGreenDelivery,
    required int greenDeliveryDelayInDays,
    required GreenDeliveryUserRole greenDeliveryUserRole,
    required bool showPOAttachment,
    required bool hideStockDisplay,
    required bool expiryDateDisplay,
    required bool batchNumDisplay,
    required bool addOosMaterials,
    required OosValue oosValue,
    required bool enableRemarks,
    required bool enableOHPrice,
    required bool poNumberRequired,
    required bool enableTaxDisplay,
    required bool netPriceOverride,
    required bool displayOrderDiscount,
    required String minOrderAmount,
    required SalesOrg salesOrg,
    required bool enableZDP8Override,
    required bool disableReturnsAccessSR,
    required bool disableReturnsAccess,
    required bool enableComboDeals,
    required ComboDealUserRole comboDealsUserRole,
  }) = _SalesOrganisationConfigs;

  factory SalesOrganisationConfigs.empty() => SalesOrganisationConfigs(
        salesOrg: SalesOrg(''),
        enableIRN: false,
        enableDefaultMD: false,
        disableProcessingStatus: false,
        currency: Currency(''),
        hideCustomer: false,
        enableGimmickMaterial: false,
        languageFilter: false,
        languageValue: LanguageValue(''),
        disablePrincipals: false,
        principalList: [],
        disableOrderType: false,
        enableBatchNumber: false,
        disableBundles: false,
        enableZDP5: false,
        enableTaxClassification: false,
        enableVat: false,
        enableTaxAtTotalLevelOnly: false,
        vatValue: 0,
        materialWithoutPrice: false,
        enableSpecialInstructions: false,
        enableReferenceNote: false,
        enableCollectiveNumber: false,
        enableMobileNumber: false,
        enableFutureDeliveryDay: false,
        enablePaymentTerms: false,
        futureDeliveryDay: FutureDeliveryDay(''),
        enableGMC: false,
        enableListPrice: false,
        priceOverride: false,
        disablePaymentTermsDisplay: false,
        disableDeliveryDate: false,
        enableBillTo: false,
        showPOAttachment: false,
        hideStockDisplay: false,
        expiryDateDisplay: false,
        addOosMaterials: false,
        oosValue: OosValue(0),
        enableRemarks: false,
        enableOHPrice: true,
        poNumberRequired: false,
        enableTaxDisplay: false,
        netPriceOverride: false,
        batchNumDisplay: false,
        displayOrderDiscount: false,
        minOrderAmount: '0',
        enableZDP8Override: false,
        disableReturnsAccessSR: false,
        disableReturnsAccess: false,
        enableGreenDelivery: false,
        greenDeliveryDelayInDays: 0,
        enableComboDeals: false,
        greenDeliveryUserRole: GreenDeliveryUserRole(0),
        comboDealsUserRole: ComboDealUserRole(0),
      );

  String get getConfigLangauge {
    return languageFilter ? languageValue.getOrDefaultValue('') : '';
  }

  bool get shouldDisplayVATInPercentage =>
      enableVat && !currency.isVN || enableTaxAtTotalLevelOnly;

  String get getConfigLangaugeDefaultEnglish =>
      languageFilter ? languageValue.getOrDefaultValue('E') : 'E';

  List get getExcludePrincipal {
    return disablePrincipals ? [] : principalList;
  }

  String get orderSummaryDisclaimer {
    switch (salesOrg.country) {
      case 'VN':
        return '\u2022Prices shown are exclusive of tax\u2022\n\n\u2022Minimum order amount allowed is $minOrderAmount ${currency.code}';
      case 'TW':
        return '\u2022價格均已含稅\n\n本網站價格及搭贈資訊係以前日資料為基礎揭示，本公司仍須以今日之授權生效的價格為最終銷售發票開立之根據\n\n\u2022金額 ${currency.code} 0 以上即可送出訂單，當日最低訂單配送金額須滿 ${currency.code} 2500';
      case 'PH':
        return '\u2022Prices shown are inclusive of tax\n\n\u2022Minimum order amount allowed is ${currency.code} $minOrderAmount';
      default:
        return '\u2022Prices shown are exclusive of tax\u2022\n\n\u2022Minimum order amount allowed is ${currency.code} $minOrderAmount';
    }
  }

  bool get shouldShowTax =>
      (enableVat && enableTaxClassification) || enableTaxAtTotalLevelOnly;
}
