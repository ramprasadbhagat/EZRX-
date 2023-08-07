part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsState with _$ViewByItemDetailsState {
  const ViewByItemDetailsState._();
  const factory ViewByItemDetailsState({
    required OrderHistory viewByItemDetails,
    required OrderHistoryItem orderHistoryItem,
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ViewByItemDetailsState;

  factory ViewByItemDetailsState.initial() => ViewByItemDetailsState(
        viewByItemDetails: OrderHistory.empty(),
        orderHistoryItem: OrderHistoryItem.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
      );
}
