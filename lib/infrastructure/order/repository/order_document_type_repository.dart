import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_document_type_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/order_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_document_type_aggregate_dto.dart';

class OrderDocumentTypeRepository implements IOrderDocumentTypeRepository {
  final Config config;
  final OrderDocumentTypeLocalDataSource orderDocumentTypLocalDataSource;
  final OrderDocumentTypeRemoteDataSource orderDocumentTypRemoteDataSource;
  final OrderStorage orderStorage;

  OrderDocumentTypeRepository({
    required this.config,
    required this.orderDocumentTypLocalDataSource,
    required this.orderDocumentTypRemoteDataSource,
    required this.orderStorage,
  });

  @override
  Future<Either<ApiFailure, List<OrderDocumentType>>> getOrderDocumentTypList({
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderDocumentTypList =
            await orderDocumentTypLocalDataSource.getOrderDocumentTypList();

        return Right(orderDocumentTypList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final orderDocumentTypList =
          await orderDocumentTypRemoteDataSource.getOrderDocumentTypList(
        salesOrgCode: salesOrgCode,
      );

      return Right(orderDocumentTypList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> deleteOrderTypeFromCartStorage() async {
    try {
      await orderStorage.deleteOrderType();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Either<ApiFailure, OrderDocumentType> getOrderTypeFromCartStorage() {
    try {
      final orderType = orderStorage.getOrderType();

      return Right(
        orderType != null ? orderType.toDomain() : OrderDocumentType.empty(),
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> putOrderTypeToCartStorage({
    required OrderDocumentType orderType,
  }) async {
    try {
      await orderStorage.putOrderType(
        orderType: OrderDocumentTypeDto.fromDomain(orderType),
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
