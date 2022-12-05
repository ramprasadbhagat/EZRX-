part of 'order_eligibility_bloc.dart';

@freezed
class OrderEligibilityState with _$OrderEligibilityState {
  const OrderEligibilityState._();

  const factory OrderEligibilityState({
    required bool eligibleForOrderSubmit,
  }) = _OrderEligibilityState;

  factory OrderEligibilityState.initial() => const OrderEligibilityState(
        eligibleForOrderSubmit: false,
      );
}
