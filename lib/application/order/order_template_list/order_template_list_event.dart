part of 'order_template_list_bloc.dart';

@freezed
class OrderTemplateListEvent with _$OrderTemplateListEvent {
  const factory OrderTemplateListEvent.initialized() = _Initialized;
  const factory OrderTemplateListEvent.fetch(User user) = _Fetch;
  const factory OrderTemplateListEvent.delete(OrderTemplate tempItem) =
      _DeleteOrderTemplate;
}
