part of 'payment_advice_footer_bloc.dart';

@freezed
class PaymentAdviceFooterEvent with _$PaymentAdviceFooterEvent {
  const factory PaymentAdviceFooterEvent.initialized() = _Initialized;
  const factory PaymentAdviceFooterEvent.fetch() = _Fetch;

}
