part of 'covid_material_list_bloc.dart';

@freezed
class CovidMaterialListState with _$CovidMaterialListState {
  const factory CovidMaterialListState({
    required List<MaterialInfo> materialList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required SearchKey searchKey,
  }) = _CovidMaterialListState;
  factory CovidMaterialListState.initial() => CovidMaterialListState(
        materialList: <MaterialInfo>[],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: true,
        nextPageIndex: 0,
        searchKey: SearchKey(''),
      );
}
