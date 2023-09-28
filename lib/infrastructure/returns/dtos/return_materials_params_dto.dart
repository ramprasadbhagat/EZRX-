import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_materials_params.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_items_filter_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_materials_params_dto.freezed.dart';
part 'return_materials_params_dto.g.dart';

@freezed
class ReturnMaterialsParamsDto with _$ReturnMaterialsParamsDto {
  const ReturnMaterialsParamsDto._();
  const factory ReturnMaterialsParamsDto({
    @JsonKey(name: 'salesOrg', defaultValue: '')
        required String salesOrg,
    @JsonKey(name: 'soldTo', defaultValue: '')
        required String soldTo,
    @JsonKey(name: 'shipTo', defaultValue: '')
        required String shipTo,
    @JsonKey(name: 'first', defaultValue: 0)
        required int first,
    @JsonKey(name: 'after', defaultValue: 0)
        required int after,
    @JsonKey(name: 'searchFilter', defaultValue: '')
        required String searchFilter,
    @JsonKey(
      name: 'filter',
      defaultValue: null,
      includeToJson: false,
    )
        required ReturnItemsFilterDto filter,
  }) = _ReturnMaterialsParamsDto;

  factory ReturnMaterialsParamsDto.fromDomain(
    ReturnMaterialsParams domain,
  ) {
    return ReturnMaterialsParamsDto(
      salesOrg: domain.salesOrg.getOrCrash(),
      soldTo: domain.soldToInfo,
      shipTo: domain.shipToInfo,
      first: domain.pageSize,
      after: domain.offset,
      filter: ReturnItemsFilterDto.fromDomain(domain.filter),
      searchFilter: domain.searchKey.searchValueOrEmpty,
    );
  }

  ReturnMaterialsParams toDomain() {
    return ReturnMaterialsParams(
      soldToInfo: soldTo,
      salesOrg: SalesOrg(salesOrg),
      shipToInfo: shipTo,
      pageSize: first,
      offset: after,
      filter: filter.toDomain,
      searchKey: SearchKey.search(searchFilter),
    );
  }

  factory ReturnMaterialsParamsDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnMaterialsParamsDtoFromJson(json);

  Map<String, dynamic> toMap() =>
      {...toJson(), ...filter.toJson()}..removeWhere(
          (key, value) => value is String && (value.isEmpty || value == '-'),
        );
}
