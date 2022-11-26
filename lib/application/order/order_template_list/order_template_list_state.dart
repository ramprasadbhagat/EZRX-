part of 'order_template_list_bloc.dart';

@freezed
class OrderTemplateListState with _$OrderTemplateListState {
  const factory OrderTemplateListState({
    required List<OrderTemplate> orderTemplateList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required TemplateName templateName,
    required bool isSubmitting,
    required bool showErrorMessages,
  }) = _OrderTemplateListState;

  factory OrderTemplateListState.initial() => OrderTemplateListState(
        orderTemplateList: <OrderTemplate>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        templateName: TemplateName(''),
        isSubmitting: false,
        showErrorMessages: false,
      );
}
