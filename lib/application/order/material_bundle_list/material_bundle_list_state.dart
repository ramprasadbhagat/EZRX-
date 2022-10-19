part of 'material_bundle_list_bloc.dart';

@freezed
class MaterialBundleListState with _$MaterialBundleListState {
  const MaterialBundleListState._();

  const factory MaterialBundleListState({
    required List<Bundle> bundleList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required String searchKey,
  }) = _MaterialBundleListState;

  factory MaterialBundleListState.initial() => MaterialBundleListState(
        bundleList: <Bundle>[],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        searchKey: '',
      );
}
