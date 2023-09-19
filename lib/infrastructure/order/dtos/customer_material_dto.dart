import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/country_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_material_dto.freezed.dart';
part 'customer_material_dto.g.dart';

@freezed
class CustomerMaterialDto with _$CustomerMaterialDto {
  const CustomerMaterialDto._();
  const factory CustomerMaterialDto({
    @JsonKey(name: 'Taxes', readValue: handleTax) required double tax,
    @JsonKey(name: 'Taxm1', defaultValue: '') required String taxm1,
    @JsonKey(name: 'TaxClassification', defaultValue: '')
        required String taxClassification,
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'PrincipalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'PrincipalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'TherapeuticClass', defaultValue: '')
        required String therapeuticClass,
    @JsonKey(name: 'ItemBrand', defaultValue: '') required String itemBrand,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
        required bool hasMandatoryTenderContract,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
    @JsonKey(name: 'IsSampleMaterial', defaultValue: false)
        required bool isSampleMaterial,
    @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'UnitOfMeasurement', defaultValue: '')
        required String unitOfMeasurement,
    @JsonKey(name: 'MaterialGroup2', defaultValue: '')
        required String materialGroup2,
    @JsonKey(name: 'MaterialGroup4', defaultValue: '')
        required String materialGroup4,
    @JsonKey(name: 'IsFOCMaterial', defaultValue: false)
        required bool isFOCMaterial,
    @JsonKey(name: 'suspensionStatus', defaultValue: false)
        required bool isSuspended,
    @JsonKey(name: 'remarks', defaultValue: '') required String remarks,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
        required String genericMaterialName,
  }) = _CustomerMaterialDto;

  MaterialInfo toDomain() => MaterialInfo(
        materialNumber: MaterialNumber(materialNumber),
        ean: '',
        materialDescription: materialDescription,
        defaultMaterialDescription: defaultMaterialDescription,
        governmentMaterialCode: governmentMaterialCode,
        therapeuticClass: therapeuticClass,
        itemBrand: itemBrand,
        principalData: PrincipalData(
          principalCode: PrincipalCode(principalCode),
          principalName: PrincipalName(principalName),
        ),
        itemRegistrationNumber: itemRegistrationNumber,
        unitOfMeasurement: StringValue(unitOfMeasurement),
        materialGroup2: MaterialGroup.two(
          materialGroup2,
        ),
        materialGroup4: MaterialGroup.four(
          materialGroup4,
        ),
        isSampleMaterial: isSampleMaterial,
        hidePrice: hidePrice,
        hasValidTenderContract: hasValidTenderContract,
        hasMandatoryTenderContract: hasMandatoryTenderContract,
        taxClassification: MaterialTaxClassification(taxClassification),
        tax: tax,
        bundles: [],
        isFOCMaterial: isFOCMaterial,
        quantity: 0,
        remarks: remarks,
        genericMaterialName: genericMaterialName,
        data: <MaterialData>[],
        dataTotalCount: 0,
        dataTotalHidden: DataTotalHidden(0),
        isFavourite: false,
        isGimmick: false,
        manufactured: '',
        name: '',
        type: MaterialInfoType(''),
        stockInfos: <StockInfo>[],
        bundle: Bundle.empty(),
        productImages: ProductImages.empty(),
        countryData: CountryData.empty(),
        parentID: '',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        promoStatus: false,
        promoType: '',
        sampleBonusItemId: '',
        isSuspended: isSuspended,
      );

  factory CustomerMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerMaterialDtoFromJson(json);
}
