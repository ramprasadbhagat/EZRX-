part of 'payment_item_bloc.dart';

@freezed
class PaymentItemState with _$PaymentItemState {
  const factory PaymentItemState({
    required List<PaymentItem> paymentItemList,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentItemState;
  factory PaymentItemState.initial() => PaymentItemState(
        paymentItemList: <PaymentItem>[],
        isFetching: false,
        failureOrSuccessOption: none(),
      );
}
