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
          StatusType('Order created'),
          StatusType('Pending release'),
          StatusType('Picking in progress'),
          StatusType('Out of delivery'),
          StatusType('Delivered'),
          StatusType('Cancelled'),
          StatusType('Failed'),
        ],
      );

  ViewByItemFilter get emptyViewByItemFilter =>
      ViewByItemFilter.empty();
}
