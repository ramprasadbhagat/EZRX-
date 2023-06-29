part of 'view_by_order_filter_bloc.dart';

@freezed
class ViewByOrderFilterEvent with _$ViewByOrderFilterEvent {
  const factory ViewByOrderFilterEvent.initialized() = _Initialized;
  const factory ViewByOrderFilterEvent.setDateRange(
    ViewByOrderHistoryFilter viewByOrderHistoryFilter,
  ) = _SetDateRange;
}
