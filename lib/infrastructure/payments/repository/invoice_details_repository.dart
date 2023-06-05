import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/payments/repository/i_invoice_details_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_remote.dart';

class InvoiceDetailsRepository extends IInvoiceDetailsRepository {
  final Config config;
  final InvoiceDetailsLocalDataSource localDataSource;
  final InvoiceDetailsRemoteDataSource remoteDataSource;
  InvoiceDetailsRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<CustomerDocumentDetail>>> getInvoiceDetails({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required CreditAndInvoiceItem invoiceItem,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getInvoiceDetails();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getInvoiceDetails(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        bpCustomerNumber: invoiceItem.bpCustomerNumber,
        fiscalYear: invoiceItem.fiscalYear,
        accountingDocument: invoiceItem.accountingDocument,
        accountingDocumentItem: invoiceItem.accountingDocumentItem,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
