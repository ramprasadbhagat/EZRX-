part of 'bonus_material_bloc.dart';

@freezed
class BonusMaterialState with _$BonusMaterialState {
  const factory BonusMaterialState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<MaterialInfo> bonus,
    required bool isStarting,
    required SearchKey searchKey,
  }) = _BonusMaterialState;

  factory BonusMaterialState.initial() => BonusMaterialState(
        failureOrSuccessOption: none(),
        bonus: <MaterialInfo>[],
        isFetching: false,
        isStarting: true,
        searchKey: SearchKey(''),
      );
}
