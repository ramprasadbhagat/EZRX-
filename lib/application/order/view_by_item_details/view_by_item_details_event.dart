part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsEvent with _$ViewByItemDetailsEvent {
  const factory ViewByItemDetailsEvent.initialized() = _Initialized;
  const factory ViewByItemDetailsEvent.fetch({
    required User user,
    required OrderHistoryItem orderHistoryItem,
    required CustomerCodeInfo soldTo,
  }) = _Fetch;
}
