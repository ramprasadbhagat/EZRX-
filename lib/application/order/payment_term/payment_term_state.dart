part of 'payment_term_bloc.dart';

@freezed
class PaymentTermState with _$PaymentTermState {
  const factory PaymentTermState({
    required List<PaymentTerm> paymentTerms,
    required List<String> paymentTermsDisplayLevels,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>>
        paymentTermsFailureOrSuccessOption,
  }) = _PaymentTermState;

  factory PaymentTermState.initial() => PaymentTermState(
        paymentTerms: <PaymentTerm>[],
        paymentTermsDisplayLevels: <String>[],
        isFetching: false,
        paymentTermsFailureOrSuccessOption: none(),
      );
}
