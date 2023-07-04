import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/product_details.dart';
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
    @JsonKey(name: 'warehouseStorageCondition', defaultValue: '')
        required String warehouseStorageCondition,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'isMarketplaceProduct', defaultValue: false)
        required bool isMarketplaceProduct,
    @JsonKey(name: 'country', defaultValue: '') required String country,
    @JsonKey(name: 'countryName', defaultValue: '') required String countryName,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'suspensionStatus', defaultValue: false)
        required bool suspensionStatus,
    @JsonKey(name: 'promoStatus', defaultValue: false)
        required bool promoStatus,
    @JsonKey(name: 'promoType', defaultValue: '') required String promoType,
  }) = _ProductDetailDto;

  ProductDetail toDomain() => ProductDetail(
        country: country,
        countryName: countryName,
        defaultMaterialDescription: defaultMaterialDescription,
        genericMaterialName: genericMaterialName,
        governmentMaterialCode: governmentMaterialCode,
        hidePrice: false,
        isFavourite: false,
        isMarketplaceProduct: false,
        itemBrand: itemBrand,
        itemRegistrationNumber: itemRegistrationNumber,
        materialBrand: materialBrand,
        materialDescription: materialDescription,
        materialNumber: MaterialNumber(materialNumber),
        principalData: PrincipalData(
          principalName: PrincipalName(principalName),
          principalCode: PrincipalCode(principalCode),
        ),
        promoStatus: false,
        promoType: promoType,
        suspensionStatus: false,
        therapeuticClass: therapeuticClass,
        unitOfMeasurement: unitOfMeasurement,
        warehouseStorageCondition: warehouseStorageCondition,
      );

  factory ProductDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDtoFromJson(json);
}
