import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
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
    @JsonKey(name: 'languageFilter', defaultValue: false)
        required bool languageFilter,
    @JsonKey(name: 'languageValue', defaultValue: '')
        required String languageValue,
    @JsonKey(name: 'disablePrincipals', defaultValue: false)
        required bool disablePrincipals,
    @_PrincipalListConverter()
    @JsonKey(name: 'principalList')
        required List principalList,
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
    @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
        required bool enablePaymentTerms,
    @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
        required String futureDeliveryDay,
    @JsonKey(name: 'enableGMC', defaultValue: false)
        required bool enableGMC,
    @JsonKey(name: 'enableListPrice', defaultValue: false)
        required bool enableListPrice,
  }) = _SalesOrganisationConfigsDto;

  factory SalesOrganisationConfigsDto.fromDomain(
    SalesOrganisationConfigs configs,
  ) {
    return SalesOrganisationConfigsDto(
      disableProcessingStatus: configs.disableProcessingStatus,
      currency: configs.currency.getOrCrash(),
      hideCustomer: configs.hideCustomer,
      enableGimmickMaterial: configs.enableGimmickMaterial,
      languageFilter: configs.languageFilter,
      languageValue: configs.languageValue,
      disablePrincipals: configs.disablePrincipals,
      principalList: configs.principalList,
      disableOrderType: configs.disableOrderType,
      enableBatchNumber: configs.enableBatchNumber,
      disableBundles: configs.disableBundles,
      enableZDP5: configs.enableZDP5,
      enableTaxClassification: configs.enableTaxClassification,
      enableVat: configs.enableVat,
      vatValue: configs.vatValue,
      materialWithoutPrice: configs.materialWithoutPrice,
      enableSpecialInstructions: configs.enableSpecialInstructions,
      enableReferenceNote: configs.enableReferenceNote,
      enableCollectiveNumber: configs.enableCollectiveNumber,
      enableMobileNumber: configs.enableMobileNumber,
      enableFutureDeliveryDay: configs.enableFutureDeliveryDay,
      enablePaymentTerms: configs.enablePaymentTerms,
      futureDeliveryDay: configs.futureDeliveryDay,
      enableGMC: configs.enableGMC,
      enableListPrice: configs.enableListPrice,
    );
  }

  SalesOrganisationConfigs toDomain() {
    return SalesOrganisationConfigs(
      disableProcessingStatus: disableProcessingStatus,
      currency: Currency(currency),
      hideCustomer: hideCustomer,
      enableGimmickMaterial: enableGimmickMaterial,
      languageFilter: languageFilter,
      languageValue: languageValue,
      disablePrincipals: disablePrincipals,
      principalList: principalList,
      disableOrderType: disableOrderType,
      enableBatchNumber: enableBatchNumber,
      disableBundles: disableBundles,
      enableZDP5: enableZDP5,
      enableTaxClassification: enableTaxClassification,
      enableVat: enableVat,
      vatValue: vatValue,
      materialWithoutPrice: materialWithoutPrice,
      enableSpecialInstructions: enableSpecialInstructions,
      enableReferenceNote: enableReferenceNote,
      enableCollectiveNumber: enableCollectiveNumber,
      enableMobileNumber: enableMobileNumber,
      enableFutureDeliveryDay: enableFutureDeliveryDay,
      enablePaymentTerms: enablePaymentTerms,
      futureDeliveryDay: futureDeliveryDay,
      enableGMC: enableGMC,
      enableListPrice: enableListPrice,
    );
  }

  factory SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrganisationConfigsDtoFromJson(json);
}

class _PrincipalListConverter
    extends JsonConverter<List, Map<String, dynamic>> {
  const _PrincipalListConverter();

  @override
  List fromJson(Map<String, dynamic> json) {
    return List.from(json['value']).map((e) => e).toList();
  }

  @override
  Map<String, dynamic> toJson(List object) {
    return {
      'value': object.map((e) => e).toList(),
    };
  }
}
