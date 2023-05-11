import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';

class DeepLinkingRepository implements IDeepLinkingRepository {
  DeepLinkingRepository();
  @override
  Either<ApiFailure, String> extractMaterialNumber({
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
            ApiFailure.materialDetailRoute(),
          );
  }

  @override
  Either<ApiFailure, String> extractOrderHistory({
    required SalesOrganisation selectedSalesOrganisation,
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final salesOrg = link.queryParameters['salesorg'];
    final customerCode = link.queryParameters['customer'];
    final shipToCode = link.queryParameters['shipto'];
    final history = link.queryParameters['history'] ?? '';
    final isValidLink =
        salesOrg == selectedSalesOrganisation.salesOrg.getValue() &&
            customerCode == selectedCustomerCode.customerCodeSoldTo &&
            shipToCode == selectedShipTo.shipToCustomerCode &&
            history.isNotEmpty;

    return isValidLink
        ? Right(history)
        : const Left(ApiFailure.historyDetailRoute());
  }
}
