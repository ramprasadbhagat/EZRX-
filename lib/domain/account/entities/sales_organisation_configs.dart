import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
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
    required Language languageValue,
    required bool disablePrincipals,
    required List<SalesOrganisationConfigsPrincipal> principalList,
    required bool disableOrderType,
    required bool enableBatchNumber,
    required bool disableBundles,
    required bool enableZDP5,
    required bool enableVat,
    required bool enableTaxAtTotalLevelOnly,
    required bool enablePOAttachmentRequired,
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
    required bool disablePayment,
    required bool disableDeliveryDate,
    required bool enableBillTo,
    required bool enableGreenDelivery,
    required int greenDeliveryDelayInDays,
    required GreenDeliveryUserRole greenDeliveryUserRole,
    required bool showPOAttachment,
    required bool hideStockDisplay,
    required bool expiryDateDisplay,
    required bool batchNumDisplay,
    required OosMaterial addOosMaterials,
    required OosValue oosValue,
    required bool enableRemarks,
    required bool enableOHPrice,
    required PoNumberRequired poNumberRequired,
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
    required bool enableGMN,
    required bool displayItemTaxBreakdown,
    required bool displaySubtotalTaxBreakdown,
    required bool disableOverrideFieldCustomer,
    required bool disableOverrideFieldSR,
    required bool hideCredit,
    required bool allowReturnsOutsidePolicy,
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
        languageValue: Language.english(),
        disablePrincipals: false,
        principalList: <SalesOrganisationConfigsPrincipal>[],
        disableOrderType: false,
        enableBatchNumber: false,
        disableBundles: false,
        enableZDP5: false,
        enableTaxClassification: false,
        enablePOAttachmentRequired: false,
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
        disablePayment: false,
        disableDeliveryDate: false,
        enableBillTo: false,
        showPOAttachment: false,
        hideStockDisplay: false,
        expiryDateDisplay: false,
        addOosMaterials: OosMaterial(false),
        oosValue: OosValue(0),
        enableRemarks: false,
        enableOHPrice: true,
        poNumberRequired: PoNumberRequired(false),
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
        enableGMN: false,
        displayItemTaxBreakdown: false,
        displaySubtotalTaxBreakdown: false,
        disableOverrideFieldCustomer: false,
        disableOverrideFieldSR: false,
        hideCredit: false,
        allowReturnsOutsidePolicy: false,
      );

  String get getConfigLanguage {
    return languageFilter ? languageValue.languageCode : '';
  }

  bool get shouldDisplayVATInPercentage =>
      enableVat && !currency.isVN || enableTaxAtTotalLevelOnly;

  Language get getConfigLanguageDefaultEnglish =>
      languageFilter ? languageValue : Language.shortEnglish();

  List<String> get getExcludePrincipal {
    return disablePrincipals ? [] : getPrincipalCodeList;
  }

  List<String> get getPrincipalCodeList =>
      principalList.map((e) => e.principalCode.getOrDefaultValue('')).toList();

  String get orderSummaryDisclaimer {
    final message = StringBuffer();
    final inclusivetaxtext = 'Prices shown are inclusive of tax'.tr();
    final exclusivetaxtext = 'Prices shown are exclusive of tax'.tr();
    final minordertext = 'Minimum order amount allowed is'.tr();
    const bullet = '\u2022';
    switch (salesOrg.country) {
      case 'VN':
        message.writeAll(
          {
            '$bullet $exclusivetaxtext',
            '$bullet $minordertext $minOrderAmount ${currency.code}',
          },
          '\n',
        );
        return message.toString();
      case 'TW':
        message.writeAll(
          {
            '$bullet $inclusivetaxtext',
            '$bullet 本網站價格及搭贈資訊係以前日資料為基礎揭示，本公司仍須以今日之授權生效的價格為最終銷售發票開立之根據',
            '$bullet 金額 ${currency.code} 0 以上即可送出訂單，當日最低訂單配送金額須滿 ${currency.code} 2500',
          },
          '\n',
        );
        return message.toString();
      case 'PH':
        message.writeAll(
          {
            '$bullet $inclusivetaxtext',
            '$bullet $minordertext ${currency.code} $minOrderAmount',
          },
          '\n',
        );
        return message.toString();
      default:
        message.writeAll(
          {
            '$bullet $exclusivetaxtext',
            '$bullet $minordertext ${currency.code} $minOrderAmount',
          },
          '\n',
        );
        return message.toString();
    }
  }

  bool get shouldShowTax =>
      (enableVat && enableTaxClassification) || enableTaxAtTotalLevelOnly;

  bool get taxDisplayForOrderHistoryAndDetails =>
      enableTaxDisplay || enableTaxAtTotalLevelOnly;

  bool get taxDisplayForOrderHistoryMaterial =>
      !enableTaxAtTotalLevelOnly && enableTaxDisplay;

  bool get enableMaterialLevelTax => enableVat && !enableTaxAtTotalLevelOnly;

  bool get enablePrincipalList => disablePrincipals && principalList.isNotEmpty;

  bool get isZdp5DiscountEligible => salesOrg.isVN && enableZDP5;

  SalesOrganisationConfigsPrincipal get checkIsPrincipalCodeForAllMaterial =>
      principalList.firstWhere(
        (principal) => principal.principalCode.isAllMaterial,
        orElse: () => SalesOrganisationConfigsPrincipal.empty(),
      );

  DateTime get deliveryStartDate {
    final currentTime = DateTime.now();

    return DateTimeUtils.getNearestWorkingDate(
      currentTime.hour < salesOrg.cutOffTime
          ? currentTime
          : currentTime.add(const Duration(days: 1)),
    );
  }

  DateTime get deliveryEndDate => DateUtils.dateOnly(
        DateTime.now().add(Duration(days: futureDeliveryDay.intValue)),
      );

  bool get showSubtotalTaxBreakdown =>
      displaySubtotalTaxBreakdown || salesOrg.isID;

  String get displayPrefixTax => showSubtotalTaxBreakdown ? 'excl' : 'incl';
}
