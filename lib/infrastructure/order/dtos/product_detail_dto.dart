import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/country_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_dto.freezed.dart';
part 'product_detail_dto.g.dart';

@freezed
class ProductDetailDto with _$ProductDetailDto {
  const ProductDetailDto._();
  factory ProductDetailDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'principalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
        required String unitOfMeasurement,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
        required String therapeuticClass,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
        required String genericMaterialName,
    @JsonKey(name: 'itemBrand', defaultValue: '') required String itemBrand,
    @JsonKey(name: 'materialBrand', defaultValue: '')
        required String materialBrand,
    @JsonKey(name: 'isFavourite', defaultValue: false)
        required bool isFavourite,
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
        required bool isFOCMaterial,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'country', defaultValue: '') required String country,
    @JsonKey(name: 'countryName', defaultValue: '') required String countryName,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'promoType', defaultValue: '') required String promoType,
    @JsonKey(name: 'promoStatus', defaultValue: false)
        required bool promoStatus,
  }) = _ProductDetailDto;

  MaterialInfo toDomain() => MaterialInfo(
        defaultMaterialDescription: defaultMaterialDescription,
        genericMaterialName: genericMaterialName,
        governmentMaterialCode: governmentMaterialCode,
        hidePrice: hidePrice,
        isFavourite: isFavourite,
        itemBrand: itemBrand,
        itemRegistrationNumber: itemRegistrationNumber,
        materialDescription: materialDescription,
        materialNumber: MaterialNumber(materialNumber),
        principalData: PrincipalData(
          principalName: PrincipalName(principalName),
          principalCode: PrincipalCode(principalCode),
        ),
        therapeuticClass: therapeuticClass,
        unitOfMeasurement: StringValue(unitOfMeasurement),
        countryData: CountryData(
          country: country,
          countryName: StringValue(countryName),
        ),
        ean: '',
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
        isSampleMaterial: false,
        hasValidTenderContract: false,
        hasMandatoryTenderContract: false,
        taxClassification: MaterialTaxClassification(''),
        bundles: [],
        isFOCMaterial: isFOCMaterial,
        quantity: 0,
        remarks: '',
        data: <MaterialData>[],
        dataTotalCount: 0,
        dataTotalHidden: DataTotalHidden(0),
        isGimmick: false,
        manufactured: '',
        name: '',
        type: MaterialInfoType(''),
        stockInfos: <StockInfo>[],
        bundle: Bundle.empty(),
        productImages: ProductImages.empty(),
        tax: 0.0,
        parentID: '',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        promoStatus: promoStatus,
        promoType: promoType,
        sampleBonusItemId: '',
      );

  factory ProductDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDtoFromJson(json);
}
