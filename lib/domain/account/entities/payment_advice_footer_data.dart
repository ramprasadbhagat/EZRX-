import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_footer_data.freezed.dart';

@freezed
class PaymentAdviceFooterData with _$PaymentAdviceFooterData {
  PaymentAdviceFooterData._();
  factory PaymentAdviceFooterData({
    required SalesOrg salesOrg,
    required SalesDistrictInfo salesDistrict,
    @Default(false) bool headerTextActive,
    required StringValue header,
    required StringValue footer,
    required StringValue note,
    required List<PlatformFile> uploadFiles,
  }) = _PaymentAdviceFooterData;

  factory PaymentAdviceFooterData.empty() => PaymentAdviceFooterData(
        salesOrg: SalesOrg(''),
        salesDistrict: SalesDistrictInfo.empty(),
        header: StringValue(''),
        footer: StringValue(''),
        note: StringValue(''),
        uploadFiles: <PlatformFile>[],
      );

  bool get isValid =>
      salesOrg.isValid() &&
      footer.isValid() &&
      (headerTextActive
      ? header.isValid()
      : uploadFiles.isNotEmpty);
}
