import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_advice_footer_response.freezed.dart';

@freezed
class AddPaymentAdviceFooterResponse with _$AddPaymentAdviceFooterResponse {
  const AddPaymentAdviceFooterResponse._();
  factory AddPaymentAdviceFooterResponse({
    required StringValue message,
  }) = _AddPaymentAdviceFooterResponse;

  factory AddPaymentAdviceFooterResponse.empty() =>
      AddPaymentAdviceFooterResponse(
        message: StringValue(''),
      );
}
