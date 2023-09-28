import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_materials_params.freezed.dart';

@freezed
class ReturnMaterialsParams with _$ReturnMaterialsParams {
  const ReturnMaterialsParams._();

  const factory ReturnMaterialsParams({
    required SalesOrg salesOrg,
    required String shipToInfo,
    required String soldToInfo,
    required int pageSize,
    required int offset,
    required ReturnItemsFilter filter,
    required SearchKey searchKey,
  }) = _ReturnMaterialsParams;

  factory ReturnMaterialsParams.empty() => ReturnMaterialsParams(
        salesOrg: SalesOrg(''),
        shipToInfo: '',
        soldToInfo: '',
        pageSize: 0,
        offset: 0,
        filter: ReturnItemsFilter.defaultDateRange(),
        searchKey: SearchKey(''),
      );
}
