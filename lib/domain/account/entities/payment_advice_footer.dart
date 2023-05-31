import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_footer.freezed.dart';

@freezed
class PaymentAdviceFooter with _$PaymentAdviceFooter {
  factory PaymentAdviceFooter({
    required SalesOrg salesOrg,
    required String salesDistrict,
    required String footer,
    required String headerLogoPath,
    required String header,
    required String pleaseNote,
  }) = _PaymentAdviceFooter;
}
