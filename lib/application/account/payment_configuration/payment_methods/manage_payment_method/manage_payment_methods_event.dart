part of 'manage_payment_methods_bloc.dart';

@freezed
class ManagePaymentMethodsEvent with _$ManagePaymentMethodsEvent {
  const factory ManagePaymentMethodsEvent.newPaymentMethodChanged({
    required String paymentMethod,
  }) = _NewPaymentMethodChanged;
  const factory ManagePaymentMethodsEvent.editPaymentMethod({
    required SalesOrg salesOrg,
    required PaymentMethod oldPaymentMethod,
  }) = _EditPaymentMethod;
  const factory ManagePaymentMethodsEvent.deletePaymentMethod({
    required SalesOrg salesOrg,
    required PaymentMethod paymentMethod,
    required int deleteIndex,
  }) = _DeletePaymentMethod;
}
