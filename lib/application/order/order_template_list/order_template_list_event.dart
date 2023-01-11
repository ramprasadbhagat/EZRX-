part of 'order_template_list_bloc.dart';

@freezed
class OrderTemplateListEvent with _$OrderTemplateListEvent {
  const factory OrderTemplateListEvent.initialized() = _Initialized;
  const factory OrderTemplateListEvent.fetch(User user) = _Fetch;
  const factory OrderTemplateListEvent.delete(OrderTemplate tempItem) =
      _DeleteOrderTemplate;

  const factory OrderTemplateListEvent.save({
    required String templateName,
    required String userID,
    required List<CartItem> cartList,
    required List<OrderTemplate> templateList,
  }) = _SaveOrderTemplate;
  const factory OrderTemplateListEvent.templateNameChanged(
    String templateNameStr,
  ) = _TemplateNameChanged;
}
