import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_template_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_remote_datasource.dart';

class OrderTemplateRepository implements IOrderTemplateRepository {
  final Config config;
  final OrderTemplateLocalDataSource orderTemplateLocalDataSource;
  final OrderTemplateRemoteDataSource orderTemplateRemoteDataSource;

  OrderTemplateRepository({
    required this.config,
    required this.orderTemplateLocalDataSource,
    required this.orderTemplateRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<OrderTemplate>>> getOrderTemplateList({
    required User user,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderTemplateListData =
            await orderTemplateLocalDataSource.getOrderTemplates();

        return Right(orderTemplateListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final orderTemplateListData =
          await orderTemplateRemoteDataSource.getOrderTemplates(
        userId: user.id,
      );

      return Right(orderTemplateListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<OrderTemplate>>> deleteOrderTemplate({
    required List<OrderTemplate> templateList,
    required OrderTemplate templateItem,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final newTempItems = List<OrderTemplate>.from(templateList)
          ..removeWhere(
            (element) => element.templateId == templateItem.templateId,
          );

        return Right(newTempItems);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final deletedTemplate =
          await orderTemplateRemoteDataSource.deleteOrderTemplate(
        templateId: templateItem.templateId,
      );

      final newTempItems = List<OrderTemplate>.from(templateList)
        ..removeWhere(
          (element) => element.templateId == deletedTemplate.templateId,
        );

      return right(newTempItems);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
