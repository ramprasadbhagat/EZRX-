import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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

  PaymentAdviceFooter toDomain() => PaymentAdviceFooter(
        key: hashCode,
        salesOrg: SalesOrg(salesOrg),
        salesDistrict: SalesDistrictInfo.empty().copyWith(
          salesDistrictHeader: StringValue(salesDistrict),
        ),
        footer: StringValue(footer),
        header: StringValue(header),
        pleaseNote: StringValue(pleaseNote),
        headerTextActive: StringValue(header).isValid(),
        paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
          logoNetworkFile: PaymentAdviceLogoNetworkFile.empty().copyWith(
            url: StringValue(headerLogoPath),
          ),
        ),
      );

  factory PaymentAdviceFooterDto.fromDomain(
    PaymentAdviceFooter paymentAdviceFooter,
  ) =>
      PaymentAdviceFooterDto(
        salesOrg: paymentAdviceFooter.salesOrg.getOrCrash(),
        salesDistrict: paymentAdviceFooter.salesDistrict.salesDistrictHeader
            .getOrDefaultValue(''),
        footer: paymentAdviceFooter.footer.getOrCrash(),
        header: paymentAdviceFooter.headerTextActive
            ? paymentAdviceFooter.header.getOrCrash()
            : paymentAdviceFooter.header.getOrDefaultValue(''),
        headerLogoPath: !paymentAdviceFooter.headerTextActive
            ? paymentAdviceFooter.paymentAdviceLogo.logoNetworkFile.url
                .getOrCrash()
            : '',
        pleaseNote: paymentAdviceFooter.pleaseNote.getOrDefaultValue(''),
      );

  factory PaymentAdviceFooterDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentAdviceFooterDtoFromJson(json);
}

@freezed
class PaymentAdviceLogoNetworkFileDto with _$PaymentAdviceLogoNetworkFileDto {
  const PaymentAdviceLogoNetworkFileDto._();
  factory PaymentAdviceLogoNetworkFileDto({
    @JsonKey(
      name: 'url',
      defaultValue: '',
    )
        required String url,
    @JsonKey(
      name: 'filename',
      defaultValue: '',
    )
        required String fileName,
  }) = _PaymentAdviceLogoNetworkFileDto;

  factory PaymentAdviceLogoNetworkFileDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentAdviceLogoNetworkFileDtoFromJson(json);

  PaymentAdviceLogoNetworkFile toDomain() => PaymentAdviceLogoNetworkFile(
        fileName: StringValue(fileName),
        url: StringValue(url),
      );
}
