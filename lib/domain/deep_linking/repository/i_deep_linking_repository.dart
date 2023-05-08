import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/deep_linking/error/redirect_failures.dart';

abstract class IDeepLinkingRepository {
  Either<RedirectFailure, String> extractMaterialNumber({
    required SalesOrganisation selectedSalesOrganisation,
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  });
}
