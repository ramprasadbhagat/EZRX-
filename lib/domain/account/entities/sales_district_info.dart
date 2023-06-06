import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district_info.freezed.dart';

@freezed
class SalesDistrictInfo with _$SalesDistrictInfo {
  const SalesDistrictInfo._();
  const factory SalesDistrictInfo({
    required int id,
    required StringValue salesDistrictHeader,
    required StringValue salesDistrictLabel,
    required bool isDeleteInProgress,
  }) = _SalesDistrictInfo;

  factory SalesDistrictInfo.empty() => SalesDistrictInfo(
        id: 0,
        salesDistrictHeader: StringValue(''),
        salesDistrictLabel: StringValue(''),
        isDeleteInProgress: false,
      );
}
