import 'package:ezrxmobile/domain/account/entities/sales_district_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district_details_dto.freezed.dart';
part 'sales_district_details_dto.g.dart';

@freezed
class SalesDistrictDetailsDto with _$SalesDistrictDetailsDto {
  const SalesDistrictDetailsDto._();

  const factory SalesDistrictDetailsDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrict,
    @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
        required String salesDistrictLabel,
  }) = _SalesDistrictDetailsDto;

  factory SalesDistrictDetailsDto.fromDomain(
    SalesDistrictDetails salesDistrictDetails,
  ) {
    return SalesDistrictDetailsDto(
        id: salesDistrictDetails.id,
        salesDistrict: salesDistrictDetails.salesDistrict,
        salesDistrictLabel: salesDistrictDetails.salesDistrictLabel,);
  }

  SalesDistrictDetails toDomain() {
    return SalesDistrictDetails(
        id: id,
        salesDistrict: salesDistrict,
        salesDistrictLabel: salesDistrictLabel,);
  }

  factory SalesDistrictDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDistrictDetailsDtoFromJson(json);
}
