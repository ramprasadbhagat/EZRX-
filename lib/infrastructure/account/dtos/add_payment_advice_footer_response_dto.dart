import 'package:ezrxmobile/domain/account/entities/add_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_advice_footer_response_dto.freezed.dart';
part 'add_payment_advice_footer_response_dto.g.dart';

@freezed
class AddPaymentAdviceFooterResponseDto
    with _$AddPaymentAdviceFooterResponseDto {
  const AddPaymentAdviceFooterResponseDto._();
  factory AddPaymentAdviceFooterResponseDto({
    @JsonKey(name: 'info', defaultValue: '') required String info,
  }) = _AddPaymentAdviceFooterResponseDto;

  factory AddPaymentAdviceFooterResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AddPaymentAdviceFooterResponseDtoFromJson(json);

  AddPaymentAdviceFooterResponse toDomain() {
    return AddPaymentAdviceFooterResponse(
      message: StringValue(info),
    );
  }
}
