import 'dart:async';
import 'package:dartz/dartz.dart';
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
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';

import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/customer_code_mock.dart';

class DeepLinkingRepositoryMock extends Mock
    implements IDeepLinkingRepository {}

void main() {
  late IDeepLinkingRepository repository;
  late DeepLinkingService service;
  late ChatBotService chatBotService;
  const fakeStream = Stream.empty();
  final fakeSubscription = fakeStream.listen((_) {});
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

  setUpAll(() {
    repository = DeepLinkingRepositoryMock();
    service = UniversalLinkServiceMock();
    chatBotService = ChatBotServiceMock();
  });

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Initialize',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
      chatBotService: chatBotService,
    ),
    act: (bloc) => bloc.add(const DeepLinkingEvent.initialize()),
    setUp: () {
      when(() => service.init()).thenAnswer((_) async => fakeSubscription);
    },
    verify: (_) {
      verify(() => service.init()).called(1);
    },
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Add pending link',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(() => chatBotService.closeChatBot())
          .thenAnswer((invocation) => Future.value(true));
    },
    act: (bloc) => bloc.add(
      DeepLinkingEvent.addPendingLink(
        Uri(scheme: 'fakeScheme', host: 'fakeHost'),
      ),
    ),
    expect: () => [
      DeepLinkingState.linkPending(
        Uri(scheme: 'fakeScheme', host: 'fakeHost'),
      )
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume pending link when state is not DeepLinkingState.linkPending',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume an unsupported pending link',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      Uri(scheme: 'fakeScheme', host: 'fakeHost'),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(fakeLinkInvalid)
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link success',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(Right(OrderNumber('fake-order-history')));
    },
    seed: () => DeepLinkingState.linkPending(Uri(path: orderDetailLink)),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      DeepLinkingState.redirectOrderDetail(OrderNumber('fake-order-history')),
    ],
  );
  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link failure',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(
        const Left(ApiFailure.orderDetailRoute()),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      Uri(path: orderDetailLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
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
        service: service,
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.getCurrentMarket(),
        ).thenReturn(Right(AppMarket.defaultMarket()));
      },
      seed: () => DeepLinkingState.linkPending(
        Uri(path: contactUsLink),
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
        service: service,
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.getCurrentMarket(),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        Uri(path: contactUsLink),
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
        service: service,
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
        Uri(path: productDetailsLink),
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
        service: service,
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
        Uri(path: productDetailsLink),
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
        service: service,
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
        Uri(path: bundleDetailsLink),
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
        service: service,
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
        Uri(path: bundleDetailsLink),
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
        service: service,
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
        Uri(path: productListingLink),
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
        service: service,
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
        Uri(path: productListingLink),
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
        service: service,
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
        Uri(path: returnSummaryLink),
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
        service: service,
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
        Uri(path: returnSummaryLink),
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
        service: service,
        repository: repository,
        chatBotService: chatBotService,
      ),
      seed: () => DeepLinkingState.linkPending(
        Uri(path: paymentLink),
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
        service: service,
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
        Uri(path: paymentSummaryInvoiceDetailsLink),
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
        service: service,
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
        Uri(path: paymentSummaryInvoiceDetailsLink),
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
        service: service,
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
        Uri(path: accountSummaryInvoiceDetailsLink),
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
        service: service,
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
        Uri(path: accountSummaryInvoiceDetailsLink),
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
        service: service,
        repository: repository,
        chatBotService: chatBotService,
      ),
      seed: () => DeepLinkingState.linkPending(
        Uri(path: faqLink),
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
}
