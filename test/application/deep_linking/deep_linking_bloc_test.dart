import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_cred.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';

import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/customer_code_mock.dart';

class DeepLinkingRepositoryMock extends Mock
    implements IDeepLinkingRepository {}

final locator = GetIt.instance;

void main() {
  late IDeepLinkingRepository repository;

  late ChatBotService chatBotService;
  const fakeStream = Stream<EzrxLink>.empty();

  final fakeCustomerCode = fakeCustomerCodeInfo;
  final fakeShipToCode = fakeShipToInfo;
  const fakeError = ApiFailure.other('fake-error');
  const fakeLinkInvalid = ApiFailure.other('Link is not valid');
  final materialNumber = MaterialNumber('000000000011002079');
  const orderDetailLink = '/my-account/orders/order-detail';
  const contactUsLink = '/contact-us';
  const productDetailsLink = '/product-details';
  const bundleDetailsLink = '/bundle-details';
  const productListingLink = '/product-listing';
  const returnSummaryLink = '/my-account/return-summary-details';
  const paymentSummaryInvoiceDetailsLink =
      '/payments/payment-summary/invoice-details';
  const accountSummaryInvoiceDetailsLink =
      '/payments/account-summary/invoice-details';
  const paymentLink = '/my-account/payments';
  const faqLink = '/faq';
  const resetPasswordLink =
      'https://clicktime.symantec.com/15tStdYPVXVZm3CGiHwjj?h=AajXDPaRNcBc9HqeqM_8ZyhyH7ej6-GwTxaPE9fxEqU=&amp;u=https://uat-sg.ezrx.com/login/set-password?username%3DFakeUser%26token%3DFakeToken';

  setUpAll(() {
    repository = DeepLinkingRepositoryMock();

    chatBotService = ChatBotServiceMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
  });

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Initialize',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    act: (bloc) => bloc.add(const DeepLinkingEvent.initialize()),
    setUp: () {
      when(() => repository.initializeDeepLink())
          .thenAnswer((_) async => const Left(fakeError));
      when(() => repository.watchDeepLinkValue()).thenAnswer(
        (_) => fakeStream,
      );
    },
    expect: () => [
      const DeepLinkingState.error(fakeError),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Add pending link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(() => chatBotService.closeChatBot())
          .thenAnswer((invocation) => Future.value(true));
    },
    act: (bloc) => bloc.add(
      DeepLinkingEvent.addPendingLink(
        EzrxLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
      ),
    ),
    expect: () => [
      DeepLinkingState.linkPending(
        EzrxLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
      ),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume pending link when state is not DeepLinkingState.linkPending',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
      ),
    ),
    expect: () => [],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume an unsupported pending link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
      ),
    ),
    expect: () => [const DeepLinkingState.error(fakeLinkInvalid)],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCodeInfo,
          selectedShipTo: fakeShipToInfo,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(Right(OrderNumber('fake-order-history')));
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(Uri(path: orderDetailLink).toString()),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
      ),
    ),
    expect: () => [
      DeepLinkingState.redirectOrderDetail(OrderNumber('fake-order-history')),
    ],
  );
  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link failure',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCodeInfo,
          selectedShipTo: fakeShipToInfo,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(
        const Left(ApiFailure.orderDetailRoute()),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(Uri(path: orderDetailLink).toString()),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
    ],
  );

  group('Redirect contact-us', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect contact-us success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.getCurrentMarket(),
        ).thenReturn(Right(AppMarket.defaultMarket()));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(contactUsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectContactUs(AppMarket.defaultMarket()),
        const DeepLinkingState.error(fakeLinkInvalid),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect contact-us failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.getCurrentMarket(),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(contactUsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
        const DeepLinkingState.error(fakeLinkInvalid),
      ],
    );
  });

  group('Product Redirection ', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: productDetailsLink),
          ),
        ).thenReturn(Right(materialNumber));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectProductDetail(materialNumber),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: productDetailsLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect bundle details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: bundleDetailsLink),
          ),
        ).thenReturn(Right(materialNumber));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(bundleDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectBundleDetail(materialNumber),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect bundle details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: bundleDetailsLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(bundleDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product listing success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractProductSearchKey(
            link: Uri(path: productListingLink),
          ),
        ).thenReturn(Right(SearchKey(materialNumber.getValue())));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productListingLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectProductSuggestion(
          SearchKey(materialNumber.getValue()),
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product listing failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractProductSearchKey(
            link: Uri(path: productListingLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productListingLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });

  group('Return redirection', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Return Summary success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractReturnId(
            selectedCustomerCode: fakeCustomerCode,
            selectedShipTo: fakeShipToCode,
            link: Uri(path: returnSummaryLink),
          ),
        ).thenReturn(Right(ReturnRequestsId(requestId: 'fake-request-id')));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(returnSummaryLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectReturnDetail(
          ReturnRequestsId(requestId: 'fake-request-id'),
        ),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Return Summary failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractReturnId(
            selectedCustomerCode: fakeCustomerCode,
            selectedShipTo: fakeShipToCode,
            link: Uri(path: returnSummaryLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(returnSummaryLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });

  group('Payment redirection', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Payment home success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(paymentLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.redirectPaymentHome(),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Payment Summary invoice Details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractPaymentIdentifierInfo(
            link: Uri(path: paymentSummaryInvoiceDetailsLink),
          ),
        ).thenReturn(
          Right(
            PaymentSummaryDetails.empty().copyWith(
              paymentID: StringValue('fake-payment-id'),
            ),
          ),
        );
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(paymentSummaryInvoiceDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectPaymentDetail(
          PaymentSummaryDetails.empty().copyWith(
            paymentID: StringValue('fake-payment-id'),
          ),
        ),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Payment Summary invoice Details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractPaymentIdentifierInfo(
            link: Uri(path: paymentSummaryInvoiceDetailsLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(paymentSummaryInvoiceDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Account Summary invoice Details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractInvoiceNumber(
            link: Uri(path: accountSummaryInvoiceDetailsLink),
          ),
        ).thenReturn(const Right('fake-invoice-number'));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(accountSummaryInvoiceDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.redirectInvoiceDetail('fake-invoice-number'),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Account Summary invoice Details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractInvoiceNumber(
            link: Uri(path: accountSummaryInvoiceDetailsLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(accountSummaryInvoiceDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });
  group('Redirect FAQ', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect FAQ success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(faqLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.redirectFAQ(),
      ],
    );
  });

  group('Redirect To Reset Password', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume reset password link success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractResetPasswordCred(
            link: Uri(
              path: '/login/set-password',
              host: 'uat-sg.ezrx.com',
              port: 443,
              queryParameters: {'username': 'FakeUser', 'token': 'FakeToken'},
              scheme: 'https',
            ),
          ),
        ).thenReturn(Right(ResetPasswordCred.empty()));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(resetPasswordLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectResetPassword(ResetPasswordCred.empty()),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume reset password link fail',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractResetPasswordCred(
            link: Uri(
              path: '/login/set-password',
              host: 'uat-sg.ezrx.com',
              port: 443,
              queryParameters: {'username': 'FakeUser', 'token': 'FakeToken'},
              scheme: 'https',
            ),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(resetPasswordLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });
}
