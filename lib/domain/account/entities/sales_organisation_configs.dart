import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_configs.freezed.dart';

@freezed
class SalesOrganisationConfigs with _$SalesOrganisationConfigs {
  const SalesOrganisationConfigs._();

  const factory SalesOrganisationConfigs({
    required Currency currency,
    required bool hideCustomer,
  }) = _SalesOrganisationConfigs;

  factory SalesOrganisationConfigs.empty() => SalesOrganisationConfigs(
        currency: Currency(''),
        hideCustomer: false,
      );
}
