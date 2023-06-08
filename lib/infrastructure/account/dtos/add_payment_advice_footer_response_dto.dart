import 'package:ezrxmobile/domain/account/entities/manage_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_advice_footer_response_dto.freezed.dart';
part 'add_payment_advice_footer_response_dto.g.dart';

@freezed
class ManagePaymentAdviceFooterResponseDto
    with _$ManagePaymentAdviceFooterResponseDto {
  const ManagePaymentAdviceFooterResponseDto._();
  factory ManagePaymentAdviceFooterResponseDto({
    @JsonKey(name: 'info', defaultValue: '') required String info,
  }) = _ManagePaymentAdviceFooterResponseDto;

  factory ManagePaymentAdviceFooterResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ManagePaymentAdviceFooterResponseDtoFromJson(json);

  ManagePaymentAdviceFooterResponse toDomain() {
    return ManagePaymentAdviceFooterResponse(
      message: PaymentAdviceResponseMessage(info),
    );
  }
}
