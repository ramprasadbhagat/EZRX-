part of 'payment_term_bloc.dart';

@freezed
class PaymentTermEvent with _$PaymentTermEvent {
  const factory PaymentTermEvent.initialized() = _Initialized;
  const factory PaymentTermEvent.fetch() = _Fetch;
}
