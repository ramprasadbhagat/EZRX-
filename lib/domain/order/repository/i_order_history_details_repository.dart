import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';

abstract class IViewByOrderDetailsRepository {
  Future<Either<ApiFailure, OrderHistoryDetails>> getViewByOrderDetails({
    required User user,
    required OrderHistoryDetailsOrderHeader orderHeader,
  });
}
