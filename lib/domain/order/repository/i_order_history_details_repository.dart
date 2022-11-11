import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';

abstract class IOrderHistoryDetailsRepository {
  Future<Either<ApiFailure, OrderHistoryDetails>> getOrderHistoryDetails({
    required User user,
    required OrderHistoryItem orderHistoryItem,
  });
}
