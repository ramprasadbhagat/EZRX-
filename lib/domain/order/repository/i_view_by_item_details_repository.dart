import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IViewByItemDetailsRepository {
  Future<Either<ApiFailure, OrderHistory>> getViewByItemDetails({
    required CustomerCodeInfo soldTo,
    required User user,
    required OrderNumber orderNumber,
  });
}
