import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_info.freezed.dart';

@freezed
class MaterialInfo with _$MaterialInfo {
  const MaterialInfo._();

  const factory MaterialInfo({

    required MaterialNumber code,
    required String name,
    required String principalCode,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String manufactured,
    required bool isFavourite,
    required MaterialInfoType type,
    required bool hidePrice,
    required List<MaterialData> data,
    required int dataTotalCount,
    required DataTotalHidden dataTotalHidden,
    required bool isGimmick,
    required List<StockInfo> stockInfos,
    required Bundle bundle,


    //TODO: remove field from v2
    required String defaultMaterialDescription,
    required String governmentMaterialCode,
    required String therapeuticClass,
    required String itemBrand,
    required PrincipalData principalData,
    required String itemRegistrationNumber,
    required String unitOfMeasurement,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required bool isSampleMaterial,
    required bool hasValidTenderContract,
    required bool hasMandatoryTenderContract,
    required MaterialTaxClassification taxClassification,
    required List<String> taxes,
    required List<Bundle> bundles,
    required bool isFOCMaterial,
    required int quantity,
    required String remarks,
    required String genericMaterialName,
    required String ean,
  }) = _MaterialInfo;

  factory MaterialInfo.empty() => MaterialInfo(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        governmentMaterialCode: '',
        therapeuticClass: '',
        itemBrand: '',
        principalData: PrincipalData(
          principalName: PrincipalName(''),
          principalCode: PrincipalCode(''),
        ),
        taxClassification: MaterialTaxClassification(''),
        itemRegistrationNumber: '',
        unitOfMeasurement: '',
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
        isSampleMaterial: false,
        hidePrice: false,
        hasValidTenderContract: false,
        hasMandatoryTenderContract: false,
        taxes: ['0'],
        defaultMaterialDescription: '',
        bundles: [],
        isFOCMaterial: false,
        quantity: 0,
        remarks: '',
        genericMaterialName: '',
        ean: '',
        code: MaterialNumber(''),
        data: <MaterialData>[],
        dataTotalCount: 0,
        dataTotalHidden: DataTotalHidden(0),
        isFavourite: false,
        isGimmick: false,
        manufactured: '',
        name: '',
        principalCode: '',
        type: MaterialInfoType(''),
        stockInfos: <StockInfo>[],
        bundle: Bundle.empty(),
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromBundles(
        materialInfo: this,
      );

  String get _displayTaxes {
    return taxes.isNotEmpty ? '${taxes.join('% , ')}%' : '0%';
  }

  String getTaxClassification(
    bool enableTaxDisplay,
    bool enableTaxClassification,
  ) {
    return enableTaxDisplay && enableTaxClassification
        ? taxClassification.getOrCrash()
        : '';
  }

  String getTotalTax(bool enableTaxDisplay) {
    return enableTaxDisplay ? '${'Total Tax: '.tr()}$_displayTaxes' : '';
  }

  String get displayDescription => materialDescription.isNotEmpty
      ? materialDescription
      : data.isNotEmpty
          ? data.first.displayDescription
          : '';

  bool get isSpecialOrderTypeMaterial => isSampleMaterial || isFOCMaterial;

  bool get inStock =>
      stockInfos.any((element) => element.inStock.isMaterialInStock);

  MaterialInfo copyWithStock({
    required List<StockInfo> stockInfos,
  }) =>
      copyWith(stockInfos: stockInfos);

  MaterialInfo fromMaterialData(MaterialData materialData) =>
      MaterialInfo.empty().copyWith(
        code: materialData.code,
        manufactured: materialData.manufactured,
        data: [materialData],
        materialDescription: materialData.materialDescription,
        governmentMaterialCode: materialData.genericMaterialName,
        genericMaterialName: materialData.genericMaterialName,
      );

  bool get listingDataNotAvailable =>
      type.typeBundle && dataTotalHidden.isDataHidden;

  bool get isMaterialHiddenOnListing => data.length > 5;

  int get listingHiddenMaterialCount => data.length - 5;

  List<MaterialData> get listingVisibleMaterial =>
      data.sublist(0, data.length > 5 ? 5 : data.length);
}

@freezed
class MaterialData with _$MaterialData {
  const MaterialData._();
  factory MaterialData({
    required MaterialNumber code,
    required String manufactured,
    required String materialDescription,
    required String defaultMaterialDescription,
    required String genericMaterialName,
    required String materialImageURL,
    required String governmentMaterialCode,
  }) = _MaterialData;

  String get displayDescription => materialDescription.isNotEmpty
      ? materialDescription
      : defaultMaterialDescription;
}

@freezed
class MaterialResponse with _$MaterialResponse {
  const MaterialResponse._();
  factory MaterialResponse({
    required int count,
    required List<MaterialInfo> products,
  }) = _MaterialResponse;

}
