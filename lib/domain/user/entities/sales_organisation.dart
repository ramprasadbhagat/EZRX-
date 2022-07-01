import 'package:ezrxmobile/domain/user/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation.freezed.dart';

@freezed
class SalesOrganisation with _$SalesOrganisation {
  const SalesOrganisation._();

  const factory SalesOrganisation({
    required SalesOrg salesOrg,
    // required CustomerCode customerCode,
    // required ShipToCode shipToCode,
  }) = _SalesOrganisation;

  factory SalesOrganisation.empty() => SalesOrganisation(
        salesOrg: SalesOrg(''),
      );
}
