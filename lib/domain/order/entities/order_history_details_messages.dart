
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_messages.freezed.dart';

@freezed
class OrderHistoryDetailsMessages with _$OrderHistoryDetailsMessages{
  const OrderHistoryDetailsMessages._();
  factory OrderHistoryDetailsMessages({
    required String type,
    required String message,
  }) = _OrderHistoryDetailsMessages;
  factory OrderHistoryDetailsMessages.empty() => OrderHistoryDetailsMessages(
        message: '',
        type: '',
      );
}
