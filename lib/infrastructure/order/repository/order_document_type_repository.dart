import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_document_type_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_local.dart';

class OrderDocumentTypeRepository implements IOrderDocumentTypeRepository {
  final Config config;
  final OrderDocumentTypeLocalDataSource orderDocumentTypLocalDataSource;

  OrderDocumentTypeRepository({
    required this.config,
    required this.orderDocumentTypLocalDataSource,
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
    
    return Left(FailureHandler.handleFailure('dev not implemented'));
  }
}
