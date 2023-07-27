import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status_tracker.freezed.dart';

@freezed
class OrderStatusTracker with _$OrderStatusTracker {
  const OrderStatusTracker._();
  factory OrderStatusTracker({
    required String action,
    required String stepName,
    required String stepStage,
    required String state,
    required StatusType status,
    required DateTimeStringValue updateTimeStamp,
  }) = _OrderStatusTracker;

  factory OrderStatusTracker.empty() => OrderStatusTracker(
        action: '',
        stepName: '',
        stepStage: '',
        state: '',
        status: StatusType(''),
        updateTimeStamp: DateTimeStringValue(''),
      );
}

extension OrderStatusTrackerExtension on List<OrderStatusTracker> {
  List<String> get orderStatusDisplay =>
      where((element) => element.action.isNotEmpty)
          .map((e) => e.action)
          .toSet()
          .toList();
}
