import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
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
    @JsonKey(name: 'languageValue', defaultValue: '')
    @HiveField(105, defaultValue: '')
        required String languageValue,
    @JsonKey(name: 'disablePrincipals', defaultValue: false)
    @HiveField(106, defaultValue: false)
        required bool disablePrincipals,
    @_PrincipalListConverter()
    @JsonKey(name: 'principalList')
    @HiveField(7, defaultValue: [])
        // TODO: Wasim , need data type here instead of List<dynamic>
        required List principalList,
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
  }) = _SalesOrganisationConfigsDto;

  factory SalesOrganisationConfigsDto.fromDomain(
    SalesOrganisationConfigs configs,
  ) {
    return SalesOrganisationConfigsDto(
      enableDefaultMD: configs.enableDefaultMD,
      priceOverride: configs.priceOverride,
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
      disablePaymentTermsDisplay: configs.disablePaymentTermsDisplay,
      disableDeliveryDate: configs.disableDeliveryDate,
      enableBillTo: configs.enableBillTo,
      showPOAttachment: configs.showPOAttachment,
      hideStockDisplay: configs.hideStockDisplay,
      expiryDateDisplay: configs.expiryDateDisplay,
      addOosMaterials: configs.addOosMaterials,
      oosValue: configs.oosValue.getOrCrash(),
      enableRemarks: configs.enableRemarks,
      enableOHPrice: configs.enableOHPrice,
    );
  }

  SalesOrganisationConfigs toDomain() {
    return SalesOrganisationConfigs(
      enableDefaultMD: enableDefaultMD,
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
