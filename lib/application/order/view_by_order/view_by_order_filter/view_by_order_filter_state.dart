part of 'view_by_order_filter_bloc.dart';

@freezed
class ViewByOrderFilterState with _$ViewByOrderFilterState {
  const ViewByOrderFilterState._();

  const factory ViewByOrderFilterState({
    required ViewByOrdersFilter filter,
    required SalesOrganisation salesOrganisation,
  }) = _ViewByOrderFilterState;

  factory ViewByOrderFilterState.initial() => ViewByOrderFilterState(
        filter: ViewByOrdersFilter.empty(),
        salesOrganisation: SalesOrganisation.empty(),
      );

  List<StatusType> get statusList => salesOrganisation.salesOrg.isID
      ? [
          StatusType('Order received'),
          StatusType('Order created'),
          StatusType('Picking in progress'),
          StatusType('Out for delivery'),
          StatusType('Delivered'),
          StatusType('Cancelled'),
        ]
      : [];
}
