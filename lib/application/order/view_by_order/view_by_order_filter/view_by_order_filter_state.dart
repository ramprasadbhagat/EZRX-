part of 'view_by_order_filter_bloc.dart';

@freezed
class ViewByOrderFilterState with _$ViewByOrderFilterState {
  const factory ViewByOrderFilterState({
    required ViewByOrdersFilter filter,
  }) = _ViewByOrderFilterState;

  factory ViewByOrderFilterState.initial() => ViewByOrderFilterState(
        filter: ViewByOrdersFilter.empty(),
      );
}
