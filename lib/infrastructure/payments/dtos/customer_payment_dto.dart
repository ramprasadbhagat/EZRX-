import 'package:ezrxmobile/infrastructure/payments/dtos/customer_payment_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_payment_dto.freezed.dart';
part 'customer_payment_dto.g.dart';

@freezed
class CustomerPaymentDto with _$CustomerPaymentDto {
  const CustomerPaymentDto._();

  const factory CustomerPaymentDto({
    @JsonKey(name: 'total', defaultValue: 0) required int total,
    @JsonKey(name: 'showing', defaultValue: 0) required int showing,
    @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
        required int totalPaymentInProgress,
    @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
        required int resultPaymentInProgress,
    @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
        required List<CustomerPaymentItemDto> customerPaymentResponse,
  }) = _CustomerPaymentDto;

  factory CustomerPaymentDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerPaymentDtoFromJson(json);
}
