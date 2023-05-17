import 'package:ezrxmobile/domain/account/entities/update_sales_org/sales_org_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_org_id_dto.freezed.dart';
part 'sales_org_id_dto.g.dart';

@freezed
class SalesOrgIdDto with _$SalesOrgIdDto {
  const SalesOrgIdDto._();
  const factory SalesOrgIdDto({
  @JsonKey(name: 'id') required int id,
  }) = _SalesOrgIdDto;

  factory SalesOrgIdDto.fromDomain(
    SalesOrgId salesOrgId,
  ) {
    return SalesOrgIdDto(
      id: salesOrgId.id,
    );
  }

  SalesOrgId toDomain() {
    return SalesOrgId(
      id: id,
    );
  }

  factory SalesOrgIdDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrgIdDtoFromJson(json);

}