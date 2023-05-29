import 'package:ezrxmobile/domain/account/entities/add_sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_sales_district_dto.freezed.dart';
part 'add_sales_district_dto.g.dart';

@freezed
class AddSalesDistrictDto with _$AddSalesDistrictDto {
  const AddSalesDistrictDto._();

  const factory AddSalesDistrictDto({
    @JsonKey(name: 'message', defaultValue: '') required String message,
  }) = _AddSalesDistrictDto;

  factory AddSalesDistrictDto.fromDomain(
    AddSalesDistrict addSalesDistrict,
  ) {
    return AddSalesDistrictDto(
        message: addSalesDistrict.message.getOrDefaultValue(''),);
  }

  AddSalesDistrict toDomain() {
    return AddSalesDistrict(message: SalesDistrictMessage(message));
  }

  factory AddSalesDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$AddSalesDistrictDtoFromJson(json);
}
