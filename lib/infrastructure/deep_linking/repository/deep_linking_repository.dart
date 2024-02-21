import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_cred.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:flutter/material.dart';

class DeepLinkingRepository implements IDeepLinkingRepository {
  final Config config;
  final DeviceStorage deviceStorage;
  final DeepLinkingService service;

  DeepLinkingRepository({
    required this.config,
    required this.deviceStorage,
    required this.service,
  });

  @override
  Either<ApiFailure, MaterialNumber> extractMaterialNumber({
    required Uri link,
  }) {
    final materialNumber = MaterialNumber(link.pathSegments.lastOrNull ?? '');
    final isValidLink = _validDomain(link) && materialNumber.isValid();

    return isValidLink
        ? Right(materialNumber)
        : const Left(ApiFailure.productDetailRoute());
  }

  @override
  Either<ApiFailure, SearchKey> extractProductSearchKey({
    required Uri link,
  }) =>
      Right(SearchKey.search(link.queryParameters['q'] ?? ''));

  @override
  Either<ApiFailure, OrderNumber> extractOrderNumber({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final orderNumber = OrderNumber(link.queryParameters['orderNumber'] ?? '');
    final customerCode = link.queryParameters['SoldTo'];
    final shipToCode = link.queryParameters['ShipTo'];

    final isValidCustomerCode = customerCode == null ||
        customerCode == selectedCustomerCode.customerCodeSoldTo;
    final isValidShipToCode =
        shipToCode == null || shipToCode == selectedShipTo.shipToCustomerCode;

    final isValidLink = _validDomain(link) &&
        isValidCustomerCode &&
        isValidShipToCode &&
        orderNumber.isValid();

    return isValidLink
        ? Right(orderNumber)
        : const Left(ApiFailure.orderDetailRoute());
  }

  @override
  Either<ApiFailure, ReturnRequestsId> extractReturnId({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final returnId =
        ReturnRequestsId(requestId: link.queryParameters['requestID'] ?? '');
    final customerCode = link.queryParameters['soldTo'];
    final shipToCode = link.queryParameters['shipTo'];

    final isValidCustomerCode = customerCode == null ||
        customerCode == selectedCustomerCode.customerCodeSoldTo;
    final isValidShipToCode =
        shipToCode == null || shipToCode == selectedShipTo.shipToCustomerCode;

    final isValidLink = _validDomain(link) &&
        isValidCustomerCode &&
        isValidShipToCode &&
        returnId.isValidRequestId;

    return isValidLink
        ? Right(returnId)
        : const Left(ApiFailure.returnDetailRoute());
  }

  @override
  Either<ApiFailure, PaymentSummaryDetails> extractPaymentIdentifierInfo({
    required Uri link,
  }) {
    final paymentBatchAdditionalInfo =
        StringValue(link.queryParameters['paymentBatchAdditionalInfo'] ?? '');
    final paymentID = StringValue(
      utf8.decode((link.queryParameters['paymentID'] ?? '').codeUnits),
    );
    final isValidLink = _validDomain(link) &&
        (paymentBatchAdditionalInfo.isValid() || paymentID.isValid());

    return isValidLink
        ? Right(
            PaymentSummaryDetails.empty().copyWith(
              paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
              paymentID: paymentID,
            ),
          )
        : const Left(ApiFailure.paymentDetailRoute());
  }

  @override
  Either<ApiFailure, String> extractInvoiceNumber({required Uri link}) {
    final invoiceNumber = link.queryParameters['invoiceNumber'] ?? '';
    final isValidLink = _validDomain(link) && invoiceNumber.isNotEmpty;

    return isValidLink
        ? Right(invoiceNumber)
        : const Left(ApiFailure.invoiceDetailRoute());
  }

  @override
  Either<ApiFailure, AppMarket> getCurrentMarket() {
    try {
      final currentMarket = deviceStorage.currentMarket();

      return Right(AppMarket(currentMarket));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Either<ApiFailure, ResetPasswordCred> extractResetPasswordCred({
    required Uri link,
  }) {
    try {
      final decodedLink = Uri.decodeFull(link.toString());
      final queryParameters = Uri.splitQueryString(
        decodedLink.characters
            .getRange(decodedLink.indexOf('?') + 1)
            .toString(),
      );

      if (!queryParameters.containsKey('username') ||
          !queryParameters.containsKey('token')) {
        return const Left(ApiFailure.passwordResetFail());
      }

      final setPassword = ResetPasswordCred(
        username: Username(queryParameters['username'] ?? ''),
        token: StringValue(queryParameters['token'] ?? ''),
      );

      return setPassword.isValid
          ? Right(setPassword)
          : const Left(ApiFailure.passwordResetFail());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initializeDeepLink() async {
    try {
      await service.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Stream<EzrxLink> watchDeepLinkValue() => service.getStream;

  bool _validDomain(Uri link) {
    final domain = link.host;
    final availableMarketDomain =
        getCurrentMarket().getOrElse(() => AppMarket('')).availableMarketDomain;

    return availableMarketDomain.any(
      (marketDomain) =>
          config.baseUrl(marketDomain: marketDomain).contains(domain),
    );
  }
}
