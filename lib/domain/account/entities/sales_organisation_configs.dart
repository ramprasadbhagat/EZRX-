import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_configs.freezed.dart';

@freezed
class SalesOrganisationConfigs with _$SalesOrganisationConfigs {
  const SalesOrganisationConfigs._();

  const factory SalesOrganisationConfigs({
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
  }) = _SalesOrganisationConfigs;

  factory SalesOrganisationConfigs.empty() => SalesOrganisationConfigs(
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
      );

  String get getConfigLangauge {
    return languageFilter ? languageValue : '';
  }

  List get getExcludePrincipal {
    return disablePrincipals ? [] : principalList;
  }
}
