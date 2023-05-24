part of 'scan_material_info_bloc.dart';

@freezed
class ScanMaterialInfoState with _$ScanMaterialInfoState {
  const ScanMaterialInfoState._();
  const factory ScanMaterialInfoState({
    required MaterialInfo material,
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
  }) = _ScanMaterialInfoState;

  factory ScanMaterialInfoState.initial() => ScanMaterialInfoState(
        material: MaterialInfo.empty(),
        user: User.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        apiFailureOrSuccessOption: none(),
        isFetching: false,
      );
}
