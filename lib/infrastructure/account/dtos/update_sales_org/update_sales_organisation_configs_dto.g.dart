// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sales_organisation_configs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateSalesOrganisationConfigsDto
    _$$_UpdateSalesOrganisationConfigsDtoFromJson(Map<String, dynamic> json) =>
        _$_UpdateSalesOrganisationConfigsDto(
          salesOrg: json['salesOrgCode'] as String? ?? '0',
          poNumberRequired: json['ponRequired'] as bool? ?? false,
          priceOverride: json['priceOverride'] as bool? ?? false,
          expiryDateDisplay: json['expiryDateDisplay'] as bool? ?? false,
          batchNumDisplay: json['batchNumDisplay'] as bool? ?? false,
          enableBatchNumber: json['enableBatchNumber'] as bool? ?? false,
          currency: json['currency'] as String,
          netPriceOverride: json['netPriceOverride'] as bool? ?? false,
          languageFilter: json['languageFilter'] as bool? ?? false,
          enableVat: json['enableVat'] as bool? ?? false,
          enableZDP5: json['enableZDP5'] as bool? ?? false,
          languageValue:
              handleEmptyLanguageValue(json, 'languageValue') as String,
          materialWithoutPrice: json['materialWithoutPrice'] as bool? ?? false,
          enableZDP8Override: json['enableZDP8Override'] as bool? ?? false,
          displayOrderDiscount: json['displayOrderDiscount'] as bool? ?? false,
          enableIRN: json['enableIRN'] as bool? ?? false,
          enableTaxClassification:
              json['enableTaxClassification'] as bool? ?? false,
          disableBundles: json['disableBundles'] as bool? ?? false,
          disableProcessingStatus: json['disableProcessingStatus'] as bool,
          enableCollectiveNumber:
              json['enableCollectiveNumber'] as bool? ?? false,
          enableGimmickMaterial:
              json['enableGimmickMaterial'] as bool? ?? false,
          hideStockDisplay: json['hideStockDisplay'] as bool? ?? false,
          showPOAttachment: json['showPOAttachment'] as bool? ?? false,
          disableDeliveryDate: json['disableDeliveryDate'] as bool? ?? false,
          enableTaxAtTotalLevelOnly:
              json['enableTaxAtTotalLevelOnly'] as bool? ?? false,
          enableGreenDelivery: json['enableGreenDelivery'] as bool? ?? false,
          greenDeliveryDelayInDays:
              json['greenDeliveryDelayInDays'] as int? ?? 2,
          greenDeliveryUserRole: json['greenDeliveryUserRole'] as int? ?? 0,
          minOrderAmount: json['minOrderAmount'] as String? ?? '0',
          hideCustomer: json['hideCustomer'] as bool? ?? false,
          disableOrderType: json['disableOrderType'] as bool? ?? false,
          vatValue: json['vatValue'] as int? ?? 0,
          enableSpecialInstructions:
              json['enableSpecialInstructions'] as bool? ?? false,
          enableReferenceNote: json['enableReferenceNote'] as bool? ?? false,
          enableMobileNumber: json['enableMobileNumber'] as bool? ?? false,
          enablePaymentTerms: json['enablePaymentTerms'] as bool? ?? false,
          enableGMC: json['enableGMC'] as bool? ?? false,
          enableListPrice: json['enableListPrice'] as bool? ?? false,
          enableDefaultMD: json['enableDefaultMD'] as bool? ?? false,
          disablePaymentTermsDisplay:
              json['disablePaymentTermsDisplay'] as bool? ?? false,
          enableBillTo: json['enableBillTo'] as bool? ?? false,
          enableOHPrice: json['enableOHPrice'] as bool? ?? true,
          addOosMaterials: json['addOosMaterials'] as bool? ?? false,
          oosValue: json['oosValue'] as int? ?? 0,
          enableRemarks: json['enableRemarks'] as bool? ?? false,
          enableTaxDisplay: json['enableTaxDisplay'] as bool? ?? false,
          enableGMN: json['enableGMN'] as bool? ?? false,
        );

Map<String, dynamic> _$$_UpdateSalesOrganisationConfigsDtoToJson(
        _$_UpdateSalesOrganisationConfigsDto instance) =>
    <String, dynamic>{
      'salesOrgCode': instance.salesOrg,
      'ponRequired': instance.poNumberRequired,
      'priceOverride': instance.priceOverride,
      'expiryDateDisplay': instance.expiryDateDisplay,
      'batchNumDisplay': instance.batchNumDisplay,
      'enableBatchNumber': instance.enableBatchNumber,
      'currency': instance.currency,
      'netPriceOverride': instance.netPriceOverride,
      'languageFilter': instance.languageFilter,
      'enableVat': instance.enableVat,
      'enableZDP5': instance.enableZDP5,
      'languageValue': instance.languageValue,
      'materialWithoutPrice': instance.materialWithoutPrice,
      'enableZDP8Override': instance.enableZDP8Override,
      'displayOrderDiscount': instance.displayOrderDiscount,
      'enableIRN': instance.enableIRN,
      'enableTaxClassification': instance.enableTaxClassification,
      'disableBundles': instance.disableBundles,
      'disableProcessingStatus': instance.disableProcessingStatus,
      'enableCollectiveNumber': instance.enableCollectiveNumber,
      'enableGimmickMaterial': instance.enableGimmickMaterial,
      'hideStockDisplay': instance.hideStockDisplay,
      'showPOAttachment': instance.showPOAttachment,
      'disableDeliveryDate': instance.disableDeliveryDate,
      'enableTaxAtTotalLevelOnly': instance.enableTaxAtTotalLevelOnly,
      'enableGreenDelivery': instance.enableGreenDelivery,
      'greenDeliveryDelayInDays': instance.greenDeliveryDelayInDays,
      'greenDeliveryUserRole': instance.greenDeliveryUserRole,
      'minOrderAmount': instance.minOrderAmount,
      'hideCustomer': instance.hideCustomer,
      'disableOrderType': instance.disableOrderType,
      'vatValue': instance.vatValue,
      'enableSpecialInstructions': instance.enableSpecialInstructions,
      'enableReferenceNote': instance.enableReferenceNote,
      'enableMobileNumber': instance.enableMobileNumber,
      'enablePaymentTerms': instance.enablePaymentTerms,
      'enableGMC': instance.enableGMC,
      'enableListPrice': instance.enableListPrice,
      'enableDefaultMD': instance.enableDefaultMD,
      'disablePaymentTermsDisplay': instance.disablePaymentTermsDisplay,
      'enableBillTo': instance.enableBillTo,
      'enableOHPrice': instance.enableOHPrice,
      'addOosMaterials': instance.addOosMaterials,
      'oosValue': instance.oosValue,
      'enableRemarks': instance.enableRemarks,
      'enableTaxDisplay': instance.enableTaxDisplay,
      'enableGMN': instance.enableGMN,
    };
