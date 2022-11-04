// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_configs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesOrganisationConfigsDto _$$_SalesOrganisationConfigsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SalesOrganisationConfigsDto(
      disableProcessingStatus: json['disableProcessingStatus'] as bool,
      currency: json['currency'] as String,
      hideCustomer: json['hideCustomer'] as bool? ?? false,
      enableGimmickMaterial: json['enableGimmickMaterial'] as bool? ?? false,
      languageFilter: json['languageFilter'] as bool? ?? false,
      languageValue: json['languageValue'] as String? ?? '',
      disablePrincipals: json['disablePrincipals'] as bool? ?? false,
      principalList: const _PrincipalListConverter()
          .fromJson(json['principalList'] as Map<String, dynamic>),
      disableOrderType: json['disableOrderType'] as bool? ?? false,
      enableBatchNumber: json['enableBatchNumber'] as bool? ?? false,
      disableBundles: json['disableBundles'] as bool? ?? false,
      enableZDP5: json['enableZDP5'] as bool? ?? false,
      enableTaxClassification:
          json['enableTaxClassification'] as bool? ?? false,
      enableVat: json['enableVat'] as bool? ?? false,
      vatValue: json['vatValue'] as int? ?? 0,
      materialWithoutPrice: json['materialWithoutPrice'] as bool? ?? false,
      enableSpecialInstructions:
          json['enableSpecialInstructions'] as bool? ?? false,
      enableReferenceNote: json['enableReferenceNote'] as bool? ?? false,
      enableCollectiveNumber: json['enableCollectiveNumber'] as bool? ?? false,
      enableMobileNumber: json['enableMobileNumber'] as bool? ?? false,
      enableFutureDeliveryDay:
          json['enableFutureDeliveryDay'] as bool? ?? false,
      enablePaymentTerms: json['enablePaymentTerms'] as bool? ?? false,
      futureDeliveryDay: json['futureDeliveryDay'] as String? ?? '',
      enableGMC: json['enableGMC'] as bool? ?? false,
      enableListPrice: json['enableListPrice'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SalesOrganisationConfigsDtoToJson(
        _$_SalesOrganisationConfigsDto instance) =>
    <String, dynamic>{
      'disableProcessingStatus': instance.disableProcessingStatus,
      'currency': instance.currency,
      'hideCustomer': instance.hideCustomer,
      'enableGimmickMaterial': instance.enableGimmickMaterial,
      'languageFilter': instance.languageFilter,
      'languageValue': instance.languageValue,
      'disablePrincipals': instance.disablePrincipals,
      'principalList':
          const _PrincipalListConverter().toJson(instance.principalList),
      'disableOrderType': instance.disableOrderType,
      'enableBatchNumber': instance.enableBatchNumber,
      'disableBundles': instance.disableBundles,
      'enableZDP5': instance.enableZDP5,
      'enableTaxClassification': instance.enableTaxClassification,
      'enableVat': instance.enableVat,
      'vatValue': instance.vatValue,
      'materialWithoutPrice': instance.materialWithoutPrice,
      'enableSpecialInstructions': instance.enableSpecialInstructions,
      'enableReferenceNote': instance.enableReferenceNote,
      'enableCollectiveNumber': instance.enableCollectiveNumber,
      'enableMobileNumber': instance.enableMobileNumber,
      'enableFutureDeliveryDay': instance.enableFutureDeliveryDay,
      'enablePaymentTerms': instance.enablePaymentTerms,
      'futureDeliveryDay': instance.futureDeliveryDay,
      'enableGMC': instance.enableGMC,
      'enableListPrice': instance.enableListPrice,
    };
