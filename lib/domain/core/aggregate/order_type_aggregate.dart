import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_type_aggregate.freezed.dart';

@freezed
class OrderDocumentTypeAggregate with _$OrderDocumentTypeAggregate {
  const OrderDocumentTypeAggregate._();
  const factory OrderDocumentTypeAggregate({
    required User user,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required bool isError,
  }) = _OrderDocumentTypeAggregate;

  factory OrderDocumentTypeAggregate.empty() => OrderDocumentTypeAggregate(
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        user: User.empty(),
        isError: false,
      );



  bool get checkOrderTypeEnable  {
    
    final checkCountryCode = salesOrganisation.salesOrg.isOrderTypeEligible;
    if (isError &&
        checkCountryCode &&
        user.role.type.isSalesRep &&
        !salesOrganisationConfigs.disableOrderType) {
      return user.enableOrderType;
    }
    
    return false;
  }

 
}
