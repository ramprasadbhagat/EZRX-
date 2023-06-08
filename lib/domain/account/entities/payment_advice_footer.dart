import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_footer.freezed.dart';

@freezed
class PaymentAdviceFooter with _$PaymentAdviceFooter {
  const PaymentAdviceFooter._();
  factory PaymentAdviceFooter({
    required int key,
    required SalesOrg salesOrg,
    required SalesDistrictInfo salesDistrict,
    required StringValue footer,
    required StringValue header,
    required StringValue pleaseNote,
    required PaymentAdviceLogo paymentAdviceLogo,
    required bool headerTextActive,
    @Default(false) bool isDeleteInProgress,
  }) = _PaymentAdviceFooter;

  factory PaymentAdviceFooter.empty() => PaymentAdviceFooter(
        key: 0,
        salesOrg: SalesOrg(''),
        salesDistrict: SalesDistrictInfo.empty(),
        footer: StringValue(''),
        header: StringValue(''),
        pleaseNote: StringValue(''),
        paymentAdviceLogo: PaymentAdviceLogo.empty(),
        headerTextActive: false,
      );

  bool get isValid =>
      salesOrg.isValid() &&
      footer.isValid() &&
      (headerTextActive
          ? header.isValid()
          : paymentAdviceLogo.logoLocalFile.isNotEmpty);

  bool get hasPaymentAdviceLogoUri =>
      paymentAdviceLogo.logoNetworkFile.url.isValid();
}

@freezed
class PaymentAdviceLogo with _$PaymentAdviceLogo {
  const PaymentAdviceLogo._();

  factory PaymentAdviceLogo({
    required PaymentAdviceLogoNetworkFile logoNetworkFile,
    required List<PlatformFile> logoLocalFile,
  }) = _PaymentAdviceLogo;

  factory PaymentAdviceLogo.empty() => PaymentAdviceLogo(
        logoNetworkFile: PaymentAdviceLogoNetworkFile.empty(),
        logoLocalFile: <PlatformFile>[],
      );
}

@freezed
class PaymentAdviceLogoNetworkFile with _$PaymentAdviceLogoNetworkFile {
  factory PaymentAdviceLogoNetworkFile({
    required StringValue url,
    required StringValue fileName,
  }) = _PaymentAdviceLogoNetworkFile;

  factory PaymentAdviceLogoNetworkFile.empty() => PaymentAdviceLogoNetworkFile(
        url: StringValue(''),
        fileName: StringValue(''),
      );
}
