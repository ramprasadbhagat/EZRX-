import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_cred.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/deep_linking/repository/deep_linking_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../chatbot/repository/chatbot_repository_test.dart';

class DeepLinkServiceMock extends Mock implements DeepLinkingService {}

void main() {
  late Config mockConfig;
  late DeviceStorage deviceStorage;
  late DeepLinkingRepository repository;
  final fakeError = MockException(message: 'fake-exception');
  const domain = 'https://uat-my.ezrx.com';

  setUpAll(() {
    mockConfig = ConfigMock();
    deviceStorage = DeviceStorageMock();
    repository = DeepLinkingRepository(
      config: mockConfig,
      deviceStorage: deviceStorage,
      service: DeepLinkServiceMock(),
    );
  });

  group('Extract Material Number', () {
    final materialNumber = MaterialNumber('fake-material-number');
    final materialDetailLink = Uri.parse(
      '$domain/product-details/${materialNumber.getValue()}',
    );
    test('=> success', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractMaterialNumber(
        link: materialDetailLink,
      );

      expect(
        result,
        Right(materialNumber),
      );
    });

    test('=> fail', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractMaterialNumber(
        link: materialDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.productDetailRoute()),
      );
    });
  });

  group('Extract Product SearchKey', () {
    final materialNumber = MaterialNumber('fake-material-number');
    final materialListLink = Uri.parse(
      '$domain/product-listing?q=${materialNumber.getValue()}',
    );
    test('=> success', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractProductSearchKey(
        link: materialListLink,
      );

      expect(
        result,
        Right(materialNumber),
      );
    });
  });

  group('Extract Invoice Number', () {
    const invoiceNumber = 'invoice-number';
    final accountInvoiceDetailsLink = Uri.parse(
      '$domain/payments/account-summary/invoice-details?invoiceNumber=$invoiceNumber',
    );
    test('=> success', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);
      final result = repository.extractInvoiceNumber(
        link: accountInvoiceDetailsLink,
      );
      expect(
        result,
        const Right(invoiceNumber),
      );
    });

    test('=> fail', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);
      final result = repository.extractInvoiceNumber(
        link: accountInvoiceDetailsLink,
      );
      expect(
        result,
        const Left(ApiFailure.invoiceDetailRoute()),
      );
    });
  });
  group('Extract order history', () {
    final orderNumber = OrderNumber('fake_order-number');
    final orderDetailLink = Uri.parse(
      '$domain/orders/order-detail?orderNumber=${orderNumber.getValue()}&SoldTo=${fakeCustomerCodeInfo.customerCodeSoldTo}&ShipTo=${fakeShipToInfo.shipToCustomerCode}',
    );
    test('=> success', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractOrderNumber(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        link: orderDetailLink,
      );

      expect(
        result,
        Right(orderNumber),
      );
    });

    test('=> fail', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);
      final result = repository.extractOrderNumber(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        link: orderDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.orderDetailRoute()),
      );
    });
  });

  group('Extract return id', () {
    final returnId = ReturnRequestsId(requestId: 'fake-return-Id');
    final returnDetailLink = Uri.parse(
      '$domain/my-account/return-summary-details?requestID=${returnId.requestId}&soldTo=${fakeCustomerCodeInfo.customerCodeSoldTo}&shipTo=${fakeShipToInfo.shipToCustomerCode}',
    );
    test('=> success', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractReturnId(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        link: returnDetailLink,
      );

      expect(
        result,
        Right(returnId),
      );
    });

    test('=> fail', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractReturnId(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        link: returnDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.returnDetailRoute()),
      );
    });
  });

  group('Extract Payment Identifier Info', () {
    final paymentId = PaymentSummaryDetails.empty().copyWith(
      paymentID: StringValue('fake-payment-id'),
      paymentBatchAdditionalInfo:
          StringValue('fake-payment-batch-additional-info'),
    );
    final returnDetailLink = Uri.parse(
      '$domain/payments/payment-summary/invoice-details?paymentID.c=${utf8.encode(paymentId.paymentID.getValue())}&paymentBatchAdditionalInfo=${paymentId.paymentBatchAdditionalInfo.getValue()}',
    );

    test('=> success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractPaymentIdentifierInfo(
        link: returnDetailLink,
      );

      expect(
        result,
        Right<ApiFailure, PaymentSummaryDetails>(
          paymentId.copyWith(
            paymentID: StringValue(''),
          ),
        ),
      );
    });

    test('=> fail', () async {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractPaymentIdentifierInfo(
        link: returnDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.paymentDetailRoute()),
      );
    });

    test('=> Success when link contains zzAdvice', () {
      const zzAdvice = '09EZ240002356801';
      final link = Uri.parse(
        '$domain/marketplace-payments/payment-summary/invoice-details?zzAdvice=$zzAdvice',
      );

      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractPaymentIdentifierInfo(
        link: link,
      );

      expect(
        result,
        Right(
          PaymentSummaryDetails.empty()
              .copyWith(zzAdvice: StringValue(zzAdvice)),
        ),
      );
    });
  });

  group('Extract reset password credentials', () {
    final resetPasswordValidUri = Uri.parse(
      '$domain/login/set-password?username%3DFakeUser%26token%3DFakeToken',
    );
    final resetPasswordInvalidUri = Uri.parse(
      '$domain/login/set-password?username%3D%26token%3D',
    );
    test('=> success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = repository.extractResetPasswordCred(
        link: resetPasswordValidUri,
      );

      expect(
        result,
        Right<ApiFailure, ResetPasswordCred>(
          ResetPasswordCred.empty().copyWith(
            username: Username('FakeUser'),
            token: StringValue('FakeToken'),
          ),
        ),
      );
    });

    test('=> fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = repository.extractResetPasswordCred(
        link: resetPasswordInvalidUri,
      );

      expect(
        result,
        const Left(ApiFailure.passwordResetFail()),
      );
    });
  });
}
