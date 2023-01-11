import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';

abstract class IOrderTemplateRepository {
  Future<Either<ApiFailure, List<OrderTemplate>>> getOrderTemplateList({
    required User user,
  });

  Future<Either<ApiFailure, List<OrderTemplate>>> deleteOrderTemplate({
    required List<OrderTemplate> templateList,
    required OrderTemplate templateItem,
  });

  Future<Either<ApiFailure, List<OrderTemplate>>> saveOrderTemplate({
    required String templateName,
    required String userID,
    required List<CartItem> cartList,
    required List<OrderTemplate> templateList,
  });
}
