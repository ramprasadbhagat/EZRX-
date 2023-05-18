part of 'add_payment_method_bloc.dart';

@freezed
class AddPaymentMethodEvent with _$AddPaymentMethodEvent {
  const factory AddPaymentMethodEvent.initialized() = _Initialized;
  const factory AddPaymentMethodEvent.salesOrgChanged({
    required String salesOrg,
  }) = _SalesOrgChanged;
  const factory AddPaymentMethodEvent.paymentMethodChanged({
    required String paymentMethod,
  }) = _paymentMethodChanged;
  const factory AddPaymentMethodEvent.addPaymentMethod() = _addPaymentMethod;
}
