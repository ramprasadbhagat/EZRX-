import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';

abstract class IOrderDocumentTypeRepository {
  Future<Either<ApiFailure, List<OrderDocumentType>>> getOrderDocumentTypList({
    required SalesOrganisation salesOrganisation,
  });
}
