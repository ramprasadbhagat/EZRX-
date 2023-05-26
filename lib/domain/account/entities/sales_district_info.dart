import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district_info.freezed.dart';

@freezed
class SalesDistrictInfo with _$SalesDistrictInfo {
  const SalesDistrictInfo._();
  const factory SalesDistrictInfo({
    required int id,
    required String salesDistrict,
    required String salesDistrictLabel,
  }) = _SalesDistrictInfo;

  factory SalesDistrictInfo.empty() => const SalesDistrictInfo(
    id: 0,
    salesDistrict: '',
    salesDistrictLabel: '',
  );
}
