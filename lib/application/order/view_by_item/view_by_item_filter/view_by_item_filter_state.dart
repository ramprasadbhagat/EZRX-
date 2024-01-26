part of 'view_by_item_filter_bloc.dart';

@freezed
class ViewByItemFilterState with _$ViewByItemFilterState {
  const ViewByItemFilterState._();

  const factory ViewByItemFilterState({
    required ViewByItemFilter filter,
    required List<StatusType> statusList,
  }) = _ViewByItemFilterState;

  factory ViewByItemFilterState.initial() => ViewByItemFilterState(
        filter: ViewByItemFilter.empty(),
        statusList: <StatusType>[
          StatusType('Order Created'),
          StatusType('Pending'),
          StatusType('Order packed and ready for delivery'),
          StatusType('Picking in progress'),
          StatusType('Out for delivery'),
          StatusType('Delivered'),
          StatusType('Cancelled'),
          StatusType('Failed'),
          StatusType('Order Creating'),
        ],
      );

  ViewByItemFilter get emptyViewByItemFilter => ViewByItemFilter.empty();
}
