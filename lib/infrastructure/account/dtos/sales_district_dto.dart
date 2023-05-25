import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_district_details_dto.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';

part 'sales_district_dto.freezed.dart';
part 'sales_district_dto.g.dart';

@freezed
class SalesDistrictDto with _$SalesDistrictDto {
  const SalesDistrictDto._();

  const factory SalesDistrictDto({
    @JsonKey(name: 'salesOrg', defaultValue: '')
        required String salesOrg,
    @JsonKey(
      name: 'salesDistricts',
    )
        required List<SalesDistrictDetailsDto> salesDistrictDetails,
  }) = _SalesDistrictDto;

  factory SalesDistrictDto.fromDomain(
    SalesDistrict salesDistrict,
  ) {
    return SalesDistrictDto(
      salesOrg: salesDistrict.salesOrg.getOrCrash(),
      salesDistrictDetails: List.from(salesDistrict.salesDistrictDetails)
          .map((e) => SalesDistrictDetailsDto.fromDomain(e))
          .toList(),
    );
  }

  SalesDistrict toDomain() {
    return SalesDistrict(
      salesOrg: SalesOrg(salesOrg),
      salesDistrictDetails:
          salesDistrictDetails.map((e) => e.toDomain()).toList(),
    );
  }

  factory SalesDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDistrictDtoFromJson(json);
}
