import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district.freezed.dart';

@freezed
class SalesDistrict with _$SalesDistrict {
  const SalesDistrict._();
  const factory SalesDistrict({
    required SalesOrg salesOrg,
    required List<SalesDistrictInfo> salesDistrictInfo,
  }) = _SalesDistrict;

  factory SalesDistrict.empty() => SalesDistrict(
        salesOrg: SalesOrg(''),
        salesDistrictInfo: <SalesDistrictInfo>[],
      );

  String get emptyOrFirstElementLabel => salesDistrictInfo.isEmpty
      ? ''
      : salesDistrictInfo.first.salesDistrictLabel.displayDashIfEmpty;
}
