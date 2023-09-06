part of 'material_price_detail_bloc.dart';

@freezed
class MaterialPriceDetailState with _$MaterialPriceDetailState {
  const MaterialPriceDetailState._();
  const factory MaterialPriceDetailState({
    required User user,
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required ShipToInfo shipToCode,
    required Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
    required bool isFetching,
    required bool isValidating,
  }) = _MaterialPriceDetailState;

  factory MaterialPriceDetailState.initial() => MaterialPriceDetailState(
        user: User.empty(),
        customerCode: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToCode: ShipToInfo.empty(),
        isFetching: false,
        isValidating: false,
        materialDetails: {},
      );

  Map<MaterialNumber, MaterialPriceDetail> get comboDealMaterialDetails {
    final comboDealMaterialDetails = {...materialDetails}
      ..removeWhere((key, value) => !key.isComboDealMaterial);

    return comboDealMaterialDetails.map(
      (key, value) => MapEntry(key.value, value),
    );
  }

  bool isValidMaterial({required MaterialQueryInfo query}) {
    final itemDetail = materialDetails[query];
    if (itemDetail != null && itemDetail.price.isValidMaterial) {
      return true;
    }

    return false;
  }
}
