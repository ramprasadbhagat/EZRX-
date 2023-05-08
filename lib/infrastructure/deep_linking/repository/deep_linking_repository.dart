import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/deep_linking/error/redirect_failures.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';

class DeepLinkingRepository implements IDeepLinkingRepository {
  DeepLinkingRepository();

  @override
  Either<RedirectFailure, String> extractMaterialNumber({
    required SalesOrganisation selectedSalesOrganisation,
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final salesOrg = link.queryParameters['salesorg'];
    final customerCode = link.queryParameters['customer'];
    final shipToCode = link.queryParameters['shipto'];
    final materialNumber = link.queryParameters['material'] ?? '';
    final isValidLink =
        salesOrg == selectedSalesOrganisation.salesOrg.getValue() &&
            customerCode == selectedCustomerCode.customerCodeSoldTo &&
            shipToCode == selectedShipTo.shipToCustomerCode &&
            materialNumber.isNotEmpty;

    return isValidLink
        ? Right(materialNumber)
        : const Left(
            RedirectFailure.materialDetailRoute(),
          );
  }
}
