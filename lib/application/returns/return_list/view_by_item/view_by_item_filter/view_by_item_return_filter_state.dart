part of 'view_by_item_return_filter_bloc.dart';

@freezed
class ViewByItemReturnFilterState with _$ViewByItemReturnFilterState {
  const ViewByItemReturnFilterState._();

  const factory ViewByItemReturnFilterState({
    required ViewByItemReturnFilter filter,
    required List<StatusType> statusList,
    required bool showErrorMessage,
  }) = _ViewByItemReturnFilterState;

  factory ViewByItemReturnFilterState.initial() => ViewByItemReturnFilterState(
        filter: ViewByItemReturnFilter.empty(),
        statusList: <StatusType>[
          StatusType('PENDING'),
          StatusType('APPROVED'),
          StatusType('REJECTED'),
        ],
        showErrorMessage: false,
      );

  ViewByItemReturnFilter get emptyViewByItemReturnFilter =>
      ViewByItemReturnFilter.empty();
}
