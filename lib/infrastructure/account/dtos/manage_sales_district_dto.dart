import 'package:ezrxmobile/domain/account/entities/manage_sales_district.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_sales_district_dto.freezed.dart';
part 'manage_sales_district_dto.g.dart';

@freezed
class ManageSalesDistrictDto with _$ManageSalesDistrictDto {
  const ManageSalesDistrictDto._();

  const factory ManageSalesDistrictDto({
    @JsonKey(name: 'message', defaultValue: '') required String message,
  }) = _ManageSalesDistrictDto;

  factory ManageSalesDistrictDto.fromDomain(
    SalesDistrictResponseMessage addSalesDistrict,
  ) {
    return ManageSalesDistrictDto(
        message: addSalesDistrict.message.getOrDefaultValue(''),);
  }

  SalesDistrictResponseMessage toDomain() {
    return SalesDistrictResponseMessage(message: StringValue(message));
  }

  factory ManageSalesDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$ManageSalesDistrictDtoFromJson(json);
}
