import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
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
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = user.role.type.isSalesRepRole
            ? await localDataSource.getOrderHistoryDetailsForSalesRep()
            : await localDataSource.getOrderHistoryDetails();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final orderHistoryDetailsList = user.role.type.isSalesRepRole
          ? await orderHistoryDetailsRemoteDataSource
              .getOrderHistoryDetailsForSalesRep(
              companyName: '',
              orderId: orderHeader.orderNumber.getOrCrash(),
              language: user.preferredLanguage.languageCode,
              userName: user.username.getOrCrash(),
            )
          : await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
              orderId: orderHeader.orderNumber.getOrCrash(),
              language: user.preferredLanguage.languageCode,
            );

      return Right(orderHistoryDetailsList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
