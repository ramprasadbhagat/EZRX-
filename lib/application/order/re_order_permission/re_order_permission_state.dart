part of 're_order_permission_bloc.dart';

@freezed
class ReOrderPermissionState with _$ReOrderPermissionState {
  const factory ReOrderPermissionState({
    required List<OrderHistoryDetailsOrderItem>
        validOrderHistoryDetailsOrderItems,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required OrderNumber orderNumberWillUpsert,
  }) = _ReOrderPermissionState;

  factory ReOrderPermissionState.initial() => ReOrderPermissionState(
        orderNumberWillUpsert: OrderNumber(''),
        validOrderHistoryDetailsOrderItems: <OrderHistoryDetailsOrderItem>[],
        isFetching: false,
        failureOrSuccessOption: none(),
      );
}
