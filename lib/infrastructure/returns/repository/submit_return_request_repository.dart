import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';

import 'package:ezrxmobile/domain/returns/repository/i_submit_request_return_repository.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_remote_datasource.dart';

import 'package:ezrxmobile/domain/returns/entities/submit_return_request.dart';

import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/submit_return_request_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';

import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_local_datasource.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

class SubmitRequestReturnRepository extends ISubmitRequestReturnRepository {
  final Config config;
  final SubmitReturnRequestLocalDataSource localDataSource;
  final SubmitReturnRequestRemoteDataSource remoteDataSource;

  SubmitRequestReturnRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, SubmitReturnResponse>> submitRequestReturn({
    required User user,
    required List<ReturnItem> returnItemsList,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrg,
    required String returnReferenceNumber,
    required String specialInstructions,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnsOverview = await localDataSource.submitReturnRequest();

        return Right(returnsOverview);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequest = _getSubmitRequest(
        customerCodeInfo: customerCodeInfo,
        returnItemsList: returnItemsList,
        returnReferenceNumber: returnReferenceNumber,
        salesOrg: salesOrg,
        specialInstructions: specialInstructions,
        user: user,
      );
      final submitReturnResponse = await remoteDataSource.submitReturnRequest(
        returnInput: SubmitReturnRequestDto.fromDomain(returnRequest).toJson(),
      );

      return Right(submitReturnResponse);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  SubmitReturnsRequest _getSubmitRequest({
    required List<ReturnItem> returnItemsList,
    required SalesOrganisation salesOrg,
    required CustomerCodeInfo customerCodeInfo,
    required String returnReferenceNumber,
    required String specialInstructions,
    required User user,
  }) =>
      SubmitReturnsRequest.empty().copyWith(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        invoiceDetails: _getInvoiceDetails(
          returnItemsList: returnItemsList,
          salesOrg: salesOrg,
        ),
        orderSource: user.role.type.orderSource,
        purchaseNumberC: returnReferenceNumber,
        specialInstruction: specialInstructions,
        subscribeStatusChange: user.settings.emailNotifications,
        username: user.username,
      );

  List<InvoiceDetails> _getInvoiceDetails({
    required List<ReturnItem> returnItemsList,
    required SalesOrganisation salesOrg,
  }) =>
      returnItemsList
          .map(
            (e) => InvoiceDetails.empty().copyWith(
              invoiceNumber: e.orderNumber,
              salesOrg: salesOrg.salesOrg,
              returnItemDetailsList: [_getReturnItemDetails(e)],
            ),
          )
          .toList();

  ReturnItemDetails _getReturnItemDetails(ReturnItem returnItem) =>
      ReturnItemDetails.empty().copyWith(
        batch: returnItem.batch,
        itemNumber: returnItem.orderNumber,
        materialNumber: returnItem.materialNumber,
        returnQuantity: ReturnQuantity(returnItem.itemQty.toString()),
        usage: Usage.empty(),
        uploadedFiles: <ReturnRequestAttachment>[],
      );
}
