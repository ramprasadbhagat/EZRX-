import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response_message.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

void main() {
  late OrderRepository orderRepositoryMock;
  final submitOrderResponse = SubmitOrderResponse.empty().copyWith(
    salesDocument: 'fake-sales-document',
    messages: [
      SubmitOrderResponseMessage.empty().copyWith(
        message: 'NO MSG',
        type: 'D',
      ),
    ],
  );

  group('Test Order Summary Bloc', () {
    setUp(
      () {
        orderRepositoryMock = OrderRepositoryMock();
      },
    );

    blocTest(
      'Order Summary Bloc Initial',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.initialized(
            config: SalesOrganisationConfigs.empty(),
          ),
        );
      },
      expect: () => [OrderSummaryState.initial()],
    );

    blocTest(
      'Order Summary submit order success',
      setUp: () {
        when(
          () => orderRepositoryMock.submitOrder(
            shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            user: User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            data: DeliveryInfoData.empty(),
            orderDocumentType: OrderDocumentType.empty()
                .copyWith(documentType: DocumentType(''), orderReason: ''),
            configs: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('PHP')),
            orderValue: 100.0,
          ),
        ).thenAnswer((value) async => Right(submitOrderResponse));
      },
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            user: User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            data: DeliveryInfoData.empty(),
            orderDocumentType: OrderDocumentType.empty()
                .copyWith(documentType: DocumentType(''), orderReason: ''),
            config: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('PHP')),
            orderValue: 100.0,
          ),
        );
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isSubmitting: true,
        ),
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isSubmitting: false,
          submitOrderResponse: submitOrderResponse,
        ),
      ],
    );

    blocTest(
      'Order Summary submit order failure',
      setUp: () {
        when(
          () => orderRepositoryMock.submitOrder(
            shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            user: User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            data: DeliveryInfoData.empty(),
            orderDocumentType: OrderDocumentType.empty().copyWith(
              documentType: DocumentType(''),
              orderReason: '',
            ),
            configs: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('PHP')),
            orderValue: 100.0,
          ),
        ).thenAnswer(
          (value) async => const Left(ApiFailure.other('Some Error')),
        );
      },
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            user: User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            data: DeliveryInfoData.empty(),
            orderDocumentType: OrderDocumentType.empty()
                .copyWith(documentType: DocumentType(''), orderReason: ''),
            config: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('PHP')),
            orderValue: 100.0,
          ),
        );
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isSubmitting: true,
        ),
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
          isSubmitting: false,
        ),
      ],
    );
  });
}
