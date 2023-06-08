import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_payment_advice_footer_response.freezed.dart';

@freezed
class ManagePaymentAdviceFooterResponse
    with _$ManagePaymentAdviceFooterResponse {
  const ManagePaymentAdviceFooterResponse._();
  factory ManagePaymentAdviceFooterResponse({
    required PaymentAdviceResponseMessage message,
  }) = _ManagePaymentAdviceFooterResponse;

  factory ManagePaymentAdviceFooterResponse.empty() =>
      ManagePaymentAdviceFooterResponse(
        message: PaymentAdviceResponseMessage(''),
      );
}
