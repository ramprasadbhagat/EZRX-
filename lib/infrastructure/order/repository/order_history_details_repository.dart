import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_remote.dart';

class OrderHistoryDetailsRepository implements IOrderHistoryDetailsRepository {
  final Config config;
  final OrderHistoryDetailsLocalDataSource localDataSource;
  final OrderHistoryDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  OrderHistoryDetailsRepository({
    required this.config,
    required this.localDataSource,
    required this.orderHistoryDetailsRemoteDataSource,
  });
  @override
  Future<Either<ApiFailure, OrderHistoryDetails>> getOrderHistoryDetails({
    required User user,
    required OrderHistoryItem orderHistoryItem,
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
              orderId: orderHistoryItem.orderNumber.getOrCrash(),
              language: '',
              userName: user.username.getOrCrash(),
            )
          : await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
              companyName: '',
              orderId: orderHistoryItem.orderNumber.getOrCrash(),
              language: '',
            );

      return Right(orderHistoryDetailsList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
