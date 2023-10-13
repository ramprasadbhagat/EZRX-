import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response_message.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

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
  final orderHistoryDetails = OrderHistoryDetails.empty().copyWith(
    orderValue: 100.0,
    totalTax: 100.0,
  );
  final seedState = OrderSummaryState.initial().copyWith(
    user: fakeRootAdminUser.copyWith(email: EmailAddress('awsib@gmail.com')),
    customerCodeInfo: fakeCustomerCodeInfo.copyWith(division: 'div'),
    shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
    salesOrgConfig: fakeSalesOrganisationConfigs.copyWith(
      currency: Currency('PHP'),
      salesOrg: fakeSalesOrg,
    ),
    salesOrganisation: fakeSalesOrganisation.copyWith(salesOrg: fakeSalesOrg),
    orderDocumentType: OrderDocumentType.empty(),
  );
  final stockInfoList = <MaterialStockInfo>[MaterialStockInfo.empty()];

  group('Test Order Summary Bloc', () {
    setUp(
      () {
        orderRepositoryMock = OrderRepositoryMock();
      },
    );

    blocTest(
      ' => Initialized event test',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.initialized(
            user: seedState.user,
            shipToInfo: seedState.shipToInfo,
            salesOrg: seedState.salesOrg,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrgConfig: seedState.salesOrgConfig,
            salesOrganisation: seedState.salesOrganisation,
            orderDocumentType: seedState.orderDocumentType,
          ),
        );
      },
      expect: () => [seedState],
    );

    blocTest(
      ' => Submit order success',
      setUp: () {
        when(
          () => orderRepositoryMock.submitOrder(
            shipToInfo: seedState.shipToInfo,
            user: seedState.user,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation:
                seedState.salesOrganisation.copyWith(salesOrg: fakeSalesOrg),
            data: DeliveryInfoData.empty(),
            orderDocumentType: seedState.orderDocumentType,
            configs: seedState.salesOrgConfig,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            orderValue: 100.0,
            totalTax: 100.0,
          ),
        ).thenAnswer((value) async => Right(submitOrderResponse));
      },
      seed: () => seedState,
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            data: DeliveryInfoData.empty(),
            orderValue: 100.0,
            totalTax: 100.0,
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          isSubmitting: true,
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
        ),
      ],
    );

    blocTest(
      ' => Submit order failure',
      setUp: () {
        when(
          () => orderRepositoryMock.submitOrder(
            shipToInfo: seedState.shipToInfo,
            user: seedState.user,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation:
                seedState.salesOrganisation.copyWith(salesOrg: fakeSalesOrg),
            data: DeliveryInfoData.empty(),
            orderDocumentType: seedState.orderDocumentType,
            configs: seedState.salesOrgConfig,
            orderValue: 100.0,
            totalTax: 100,
          ),
        ).thenAnswer(
          (value) async => const Left(ApiFailure.other('Some Error')),
        );
      },
      seed: () => seedState,
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            data: DeliveryInfoData.empty(),
            orderValue: 100.0,
            totalTax: 100,
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          isSubmitting: true,
        ),
        seedState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
        ),
      ],
    );

    blocTest(
      ' => Get order confirmation detail success',
      setUp: () {
        when(
          () => orderRepositoryMock.getOrderConfirmationDetail(
            user: seedState.user,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation: seedState.salesOrganisation,
            orderResponse: submitOrderResponse,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
          ),
        ).thenAnswer(
          (value) async => Right(orderHistoryDetails),
        );
        when(
          () => orderRepositoryMock.getConfirmedOrderStockInfo(
            salesOrg: seedState.salesOrg,
            customerCodeInfo: seedState.customerCodeInfo,
            orderHistoryDetails: orderHistoryDetails,
          ),
        ).thenAnswer(
          (value) async => Right(stockInfoList),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.orderConfirmationDetail(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
          orderHistoryDetails: orderHistoryDetails,
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          orderHistoryDetails: orderHistoryDetails,
        ),
      ],
    );

    blocTest(
      ' => Get order confirmation detail failure',
      setUp: () {
        when(
          () => orderRepositoryMock.getOrderConfirmationDetail(
            user: seedState.user,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation:
                fakeSalesOrganisation.copyWith(salesOrg: fakeSalesOrg),
            orderResponse: submitOrderResponse,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
          ),
        ).thenAnswer(
          (value) async => const Left(ApiFailure.other('Some Error')),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.orderConfirmationDetail(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
        ),
      ],
    );

    blocTest(
      ' => Get confirmed order stock info success',
      setUp: () {
        when(
          () => orderRepositoryMock.getConfirmedOrderStockInfo(
            salesOrg: seedState.salesOrg,
            customerCodeInfo: seedState.customerCodeInfo,
            orderHistoryDetails: orderHistoryDetails,
          ),
        ).thenAnswer(
          (value) async => Right(stockInfoList),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.confirmedOrderStockInfo(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            orderHistoryDetails: orderHistoryDetails,
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          orderHistoryDetails: orderHistoryDetails,
        ),
      ],
    );

    blocTest(
      ' => Get confirmed order stock info failure',
      setUp: () {
        when(
          () => orderRepositoryMock.getConfirmedOrderStockInfo(
            customerCodeInfo: seedState.customerCodeInfo,
            orderHistoryDetails: orderHistoryDetails,
            salesOrg: seedState.salesOrg,
          ),
        ).thenAnswer(
          (value) async => const Left(ApiFailure.other('Some Error')),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.confirmedOrderStockInfo(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            orderHistoryDetails: orderHistoryDetails,
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
        ),
      ],
    );

    blocTest(
      ' => UpdateIsExpanded event when isExpanded is true',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => seedState,
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          const OrderSummaryEvent.updateIsExpanded(
            isExpanded: true,
          ),
        );
      },
      expect: () => [seedState.copyWith(isExpanded: true)],
    );

    blocTest(
      ' => UpdateIsExpanded event when isExpanded is false',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => seedState.copyWith(
        isExpanded: true,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          const OrderSummaryEvent.updateIsExpanded(
            isExpanded: false,
          ),
        );
      },
      expect: () => [seedState],
    );
  });
}
