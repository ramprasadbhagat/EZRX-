part of 'payment_methods_bloc.dart';

@freezed
class PaymentMethodsEvent with _$PaymentMethodsEvent {
  const factory PaymentMethodsEvent.initialized() = _Initialized;
  const factory PaymentMethodsEvent.fetch() = _Fetch;
}
