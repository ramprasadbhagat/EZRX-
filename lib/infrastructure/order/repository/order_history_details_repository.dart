import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history__details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_details_local.dart';

class OrderHistoryDetailsRepository implements IOrderHistoryDetailsRepository {
  final OrderHistoryDetailsLocalDataSource localDataSource;
  OrderHistoryDetailsRepository({
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, OrderHistoryDetails>> getOrderHistoryDetails({
    required User user,
  }) async {
    try {
      final result = user.role.type.isSalesRep
          ? await localDataSource.getOrderHistoryDetailsForSalesRep()
          : await localDataSource.getOrderHistoryDetails();

      return Right(result);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
