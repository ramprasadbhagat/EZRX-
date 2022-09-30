part of 'material_list_bloc.dart';

@freezed
class MaterialListState with _$MaterialListState {
  const factory MaterialListState({
    required List<MaterialInfo> materialList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required String searchKey,
  }) = _MaterialListState;

  factory MaterialListState.initial() => MaterialListState(
        materialList: <MaterialInfo>[],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: true,
        nextPageIndex: 0,
        searchKey: '',
      );
}
