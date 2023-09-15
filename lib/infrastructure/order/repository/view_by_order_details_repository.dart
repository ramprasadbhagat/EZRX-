import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';

class ViewByOrderDetailsRepository implements IViewByOrderDetailsRepository {
  final Config config;
  final ViewByOrderDetailsLocalDataSource localDataSource;
  final ViewByOrderDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  ViewByOrderDetailsRepository({
    required this.config,
    required this.localDataSource,
    required this.orderHistoryDetailsRemoteDataSource,
  });
  @override
  Future<Either<ApiFailure, OrderHistoryDetails>> getViewByOrderDetails({
    required User user,
    required OrderHistoryDetailsOrderHeader orderHeader,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = await localDataSource.getOrderHistoryDetails();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final orderHistoryDetailsList =
          await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
        searchKey: orderHeader.orderNumber.getOrCrash(),
        language: user.preferredLanguage.languageCode,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        soldTo: customerCodeInfo.customerCodeSoldTo,
      );

      return Right(orderHistoryDetailsList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
