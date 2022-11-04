import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_configs.freezed.dart';

@freezed
class SalesOrganisationConfigs with _$SalesOrganisationConfigs {
  const SalesOrganisationConfigs._();

  const factory SalesOrganisationConfigs({
    required bool disableProcessingStatus,
    required Currency currency,
    required bool hideCustomer,
    required bool enableGimmickMaterial,
    required bool languageFilter,
    required String languageValue,
    required bool disablePrincipals,
    required List principalList,
    required bool disableOrderType,
    required bool enableBatchNumber,
    required bool disableBundles,
    required bool enableZDP5,
    required bool enableVat,
    required bool enableTaxClassification,
    required int vatValue,
    required bool materialWithoutPrice,
    required bool enableSpecialInstructions,
    required bool enableReferenceNote,
    required bool enableCollectiveNumber,
    required bool enableMobileNumber,
    required bool enableFutureDeliveryDay,
    required bool enablePaymentTerms,
    required String futureDeliveryDay,
    required bool enableGMC,
  }) = _SalesOrganisationConfigs;

  factory SalesOrganisationConfigs.empty() => SalesOrganisationConfigs(
        disableProcessingStatus: false,
        currency: Currency(''),
        hideCustomer: false,
        enableGimmickMaterial: false,
        languageFilter: false,
        languageValue: '',
        disablePrincipals: false,
        principalList: [],
        disableOrderType: false,
        enableBatchNumber: false,
        disableBundles: false,
        enableZDP5: false,
        enableTaxClassification: false,
        enableVat: false,
        vatValue: 0,
        materialWithoutPrice: false,
        enableSpecialInstructions: false,
        enableReferenceNote: false,
        enableCollectiveNumber: false,
        enableMobileNumber: false,
        enableFutureDeliveryDay: false,
        enablePaymentTerms: false,
        futureDeliveryDay: '',
        enableGMC: false,
      );

  String get getConfigLangauge {
    return languageFilter ? languageValue : '';
  }

  List get getExcludePrincipal {
    return disablePrincipals ? [] : principalList;
  }
}
