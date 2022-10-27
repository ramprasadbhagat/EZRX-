import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/repository/i_customer_material_price_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/customer_material_price_details_local.dart';

class CustomerMaterialPriceDetailsRepository
    implements ICustomerMaterialPriceDetailsRepository {
  final Config config;
  final CustomerMaterialPriceDetailsLocalDataSource
      customerMaterialPriceDetailsLocalDataSource;

  CustomerMaterialPriceDetailsRepository({
    required this.config,
    required this.customerMaterialPriceDetailsLocalDataSource,
  });

  @override
  Future<Either<ApiFailure, List<dynamic>>> getCustomerMaterialPriceDetails({
    required String customerCodeInfo,
    required String shipToInfo,
    required String salesOrganisation,
    required List request,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final customerMaterialPriceDetailsLocalData =
            await customerMaterialPriceDetailsLocalDataSource
                .getCustomerMaterialPriceDetails();

        return Right(customerMaterialPriceDetailsLocalData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    throw UnimplementedError();
  }
}
