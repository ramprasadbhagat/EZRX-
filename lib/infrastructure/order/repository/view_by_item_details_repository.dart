import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_details_remote.dart';

class ViewByItemDetailsRepository implements IViewByItemDetailsRepository {
  final Config config;
  final ViewByItemDetailsLocalDataSource localDataSource;
  final ViewByItemDetailsRemoteDataSource orderHistoryRemoteDataSource;

  ViewByItemDetailsRepository({
    required this.config,
    required this.localDataSource,
    required this.orderHistoryRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, OrderHistory>> getViewByItemDetails({
    required CustomerCodeInfo soldTo,
    required OrderNumber orderNumber,
    required User user,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = await localDataSource.getViewByItemDetails();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final viewByItemDetailsList =
          await orderHistoryRemoteDataSource.getViewByItemDetails(
        soldTo: soldTo.customerCodeSoldTo,
        language: user.preferredLanguage.getOrCrash(),
        orderNumber: orderNumber.getOrDefaultValue(''),
      );

      return Right(viewByItemDetailsList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
