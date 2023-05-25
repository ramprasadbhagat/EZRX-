import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district_details.freezed.dart';

@freezed
class SalesDistrictDetails with _$SalesDistrictDetails {
  const SalesDistrictDetails._();

  const factory SalesDistrictDetails({
    required int id,
    required String salesDistrict,
    required String salesDistrictLabel,
  }) = _SalesDistrictDetails;

  factory SalesDistrictDetails.empty() => const SalesDistrictDetails(
      id: 0, salesDistrict: '', salesDistrictLabel: '',);
}
