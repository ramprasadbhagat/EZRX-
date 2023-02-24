part of 'scan_material_info_bloc.dart';

@freezed
class ScanMaterialInfoState with _$ScanMaterialInfoState {
  const ScanMaterialInfoState._();
  const factory ScanMaterialInfoState({
    required String scannedData,
   
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _ScanMaterialInfoState;

  factory ScanMaterialInfoState.initial() => ScanMaterialInfoState(
        scannedData: '',
        apiFailureOrSuccessOption: none(),
      );
}
