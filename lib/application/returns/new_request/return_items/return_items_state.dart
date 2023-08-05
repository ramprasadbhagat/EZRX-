part of 'return_items_bloc.dart';

@freezed
class ReturnItemsState with _$ReturnItemsState {
  const ReturnItemsState._();
  const factory ReturnItemsState({
    required List<ReturnMaterial> items,
    required Option<Either<ApiFailure, ReturnMaterialList>>
        failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
  }) = _ReturnItemsState;

  factory ReturnItemsState.initial() => ReturnItemsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        items: <ReturnMaterial>[],
      );
}
