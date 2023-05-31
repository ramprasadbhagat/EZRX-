import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_footer_dto.freezed.dart';
part 'payment_advice_footer_dto.g.dart';

@freezed
class PaymentAdviceFooterDto with _$PaymentAdviceFooterDto {
  PaymentAdviceFooterDto._();
  factory PaymentAdviceFooterDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrict,
    @JsonKey(name: 'footer', defaultValue: '') required String footer,
    @JsonKey(name: 'headerLogoPath', defaultValue: '')
        required String headerLogoPath,
    @JsonKey(name: 'header', defaultValue: '') required String header,
    @JsonKey(name: 'pleaseNote', defaultValue: '') required String pleaseNote,
  }) = _PaymentAdviceFooterDto;

  PaymentAdviceFooter toDomain() {
    return PaymentAdviceFooter(
      salesOrg: SalesOrg(salesOrg),
      salesDistrict: salesDistrict,
      footer: footer,
      headerLogoPath: headerLogoPath,
      header: header,
      pleaseNote: pleaseNote,
    );
  }

  factory PaymentAdviceFooterDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentAdviceFooterDtoFromJson(json);
}
