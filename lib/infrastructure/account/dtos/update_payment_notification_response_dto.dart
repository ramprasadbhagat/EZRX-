import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:ezrxmobile/domain/account/entities/update_payment_notification_response.dart';

part 'update_payment_notification_response_dto.freezed.dart';
part 'update_payment_notification_response_dto.g.dart';


@freezed
class UpdatePaymentNotificationResponseDto with _$UpdatePaymentNotificationResponseDto {
  const UpdatePaymentNotificationResponseDto._();

  const factory UpdatePaymentNotificationResponseDto({
    @JsonKey(name: 'message') required String message,
  }) = _UpdatePaymentNotificationResponseDto;


  UpdatePaymentNotificationResponse toDomain() {
    return UpdatePaymentNotificationResponse(
     message: message,
    );
  }

  factory UpdatePaymentNotificationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePaymentNotificationResponseDtoFromJson(json);
}
