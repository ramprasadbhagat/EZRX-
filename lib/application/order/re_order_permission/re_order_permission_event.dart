part of 're_order_permission_bloc.dart';

@freezed
class ReOrderPermissionEvent with _$ReOrderPermissionEvent {
  const factory ReOrderPermissionEvent.initialized() = _Initialized;
  const factory ReOrderPermissionEvent.fetch({
    required List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisation salesOrganisation,
    required OrderNumber orderNumberWillUpsert,
  }) = _Fetch;
  const factory ReOrderPermissionEvent.resetOrderNumberWillUpsert({
    required OrderNumber orderNumberWillUpsert,
  }) = _ResetOrderNumberWillUpsert;
}
