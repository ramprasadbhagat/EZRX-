import 'package:ezrxmobile/domain/account/entities/customer_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation.freezed.dart';

@freezed
class SalesOrganisation with _$SalesOrganisation {
  const SalesOrganisation._();

  const factory SalesOrganisation({
    required SalesOrg salesOrg,
    required List<CustomerInfo> customerInfos,
    // required ShipToCode shipToCode,
  }) = _SalesOrganisation;

  factory SalesOrganisation.empty() => SalesOrganisation(
        salesOrg: SalesOrg(''),
        customerInfos: <CustomerInfo>[],
      );
}
