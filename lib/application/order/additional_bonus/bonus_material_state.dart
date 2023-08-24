part of 'bonus_material_bloc.dart';

@freezed
class BonusMaterialState with _$BonusMaterialState {
  const factory BonusMaterialState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<MaterialInfo> bonusItemList,
    required bool canLoadMore,
    required int bonusMaterialHashCode,
    required bool isBonusQtyValidated,
  }) = _BonusMaterialState;

  factory BonusMaterialState.initial() => BonusMaterialState(
        failureOrSuccessOption: none(),
        bonusItemList: <MaterialInfo>[],
        canLoadMore: true,
        isFetching: false,
        bonusMaterialHashCode: 0,
        isBonusQtyValidated: true,
      );
}
