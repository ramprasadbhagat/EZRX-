import 'package:ezrxmobile/domain/order/entities/order_history_details_messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_messages_dto.freezed.dart';
part 'order_history_details_messages_dto.g.dart';
@freezed
class OrderHistoryDetailsMessagesDto with _$OrderHistoryDetailsMessagesDto {
  const OrderHistoryDetailsMessagesDto._();
  const factory OrderHistoryDetailsMessagesDto({
    @JsonKey(name: 'Type') required String type,
    @JsonKey(name: 'Message') required String message,
  }) = _OrderHistoryDetailsMessagesDto;
  factory OrderHistoryDetailsMessagesDto.fromDomain(OrderHistoryDetailsMessages orderHistoryDetailsMessages) {
    return OrderHistoryDetailsMessagesDto(
        message: orderHistoryDetailsMessages.message, type: orderHistoryDetailsMessages.type,);
  }

  OrderHistoryDetailsMessages toDomain() {
    return OrderHistoryDetailsMessages(type: type,
     message: message,);
  }
 
  factory OrderHistoryDetailsMessagesDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsMessagesDtoFromJson(json);
}
