part of 'bonus_material_bloc.dart';

@freezed
class BonusMaterialState with _$BonusMaterialState {
  const factory BonusMaterialState({
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<MaterialInfo> bonus,
  }) = _BonusMaterialState;

  factory BonusMaterialState.initial() => BonusMaterialState(
        failureOrSuccessOption: none(),
        bonus: <MaterialInfo>[],
      );
}
