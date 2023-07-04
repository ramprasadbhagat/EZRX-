import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details.freezed.dart';

@freezed
class ProductDetail with _$ProductDetail {
  const ProductDetail._();
  factory ProductDetail({
    required MaterialNumber materialNumber,
    required String materialDescription,
    required PrincipalData principalData,
    required String unitOfMeasurement,
    required String therapeuticClass,
    required String genericMaterialName,
    required String itemBrand,
    required String materialBrand,
    required bool isFavourite,
    required String warehouseStorageCondition,
    required String defaultMaterialDescription,
    required bool isMarketplaceProduct,
    required String country,
    required String countryName,
    required bool hidePrice,
    required String governmentMaterialCode,
    required String itemRegistrationNumber,
    required bool suspensionStatus,
    required bool promoStatus,
    required String promoType,
  }) = _ProductDetails;

  factory ProductDetail.empty() => ProductDetail(
        materialNumber: MaterialNumber(''),
        country: '',
        countryName: '',
        defaultMaterialDescription: '',
        genericMaterialName: '',
        governmentMaterialCode: '',
        hidePrice: false,
        isFavourite: false,
        isMarketplaceProduct: false,
        itemBrand: '',
        itemRegistrationNumber: '',
        materialBrand: '',
        materialDescription: '',
        principalData: PrincipalData(
          principalName: PrincipalName(''),
          principalCode: PrincipalCode(''),
        ),
        promoStatus: false,
        promoType: '',
        suspensionStatus: false,
        therapeuticClass: '',
        unitOfMeasurement: '',
        warehouseStorageCondition: '',
      );

  MaterialInfo toMaterialInfo() => MaterialInfo.empty().copyWith(
        materialNumber: materialNumber,
        materialDescription: materialDescription,
        principalData: principalData,
        genericMaterialName: genericMaterialName,
        hidePrice: hidePrice,
        isFavourite: isFavourite,
        itemBrand: itemBrand,
        itemRegistrationNumber: itemRegistrationNumber,
        defaultMaterialDescription: materialDescription,
        therapeuticClass: therapeuticClass,
        unitOfMeasurement: unitOfMeasurement,
      );
}
