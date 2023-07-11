import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_template_repository.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_dto.dart';

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

  List<MaterialItem> _getItemList(List<CartItem> cartItemList) => cartItemList
      .map((cartItem) => cartItem.toSavedOrderMaterial())
      .toList()
      .expand((element) => element)
      .toList();

  @override
  Future<Either<ApiFailure, List<OrderTemplate>>> saveOrderTemplate({
    required String templateName,
    required String userID,
    required List<CartItem> cartList,
    required List<OrderTemplate> templateList,
  }) async {
    final materialList = _getItemList(cartList);
    if (config.appFlavor == Flavor.mock) {
      try {
        final savedTemplate =
            await orderTemplateLocalDataSource.saveOrderTemplate();
        final newOrderTemplateList = List<OrderTemplate>.from(templateList)
          ..insert(0, savedTemplate);

        return right(newOrderTemplateList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final cartListOfMap = List.from(materialList)
          .map((e) => MaterialItemDto.fromDomain(e).toJson())
          .toList();

      final savedTemplate =
          await orderTemplateRemoteDataSource.saveOrderTemplate(
        templateName: templateName,
        userID: userID,
        cartList: cartListOfMap,
      );

      final newOrderTemplateList = List<OrderTemplate>.from(templateList)
        ..insert(0, savedTemplate);

      return right(newOrderTemplateList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
