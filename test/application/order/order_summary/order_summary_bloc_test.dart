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
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response_message.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

void main() {
  //TestWidgetsFlutterBinding.ensureInitialized();
  late OrderRepository orderRepositoryMock;
  final submitOrderResponse = SubmitOrderResponse.empty()
      .copyWith(salesDocument: 'fake-sales-document', messages: [
    SubmitOrderResponseMessage.empty().copyWith(
      message: 'NO MSG',
      type: 'D',
    ),
  ]);

  group('Test Order Summary Bloc', () {
    setUp(
      () {
        orderRepositoryMock = OrderRepositoryMock();
      },
    );
    blocTest<OrderSummaryBloc, OrderSummaryState>(
      '==> Initialize and Navigate Stepper',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (bloc) => bloc
        ..add(const OrderSummaryEvent.initialized(
          additionalDetailsStep: 3,
          maxSteps: 5,
          step: 0,
        ))
        ..add(const OrderSummaryEvent.stepContinue())
        ..add(const OrderSummaryEvent.stepCancel())
        ..add(const OrderSummaryEvent.stepTapped(step: 2)),
      expect: () => [
        OrderSummaryState.initial().copyWith(
          maxSteps: 5,
          step: 0,
        ),
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          step: 1,
        ),
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          step: 0,
        ),
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          step: 2,
        ),
      ],
    );

    blocTest(
      'Order Summary Bloc Initial',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(const OrderSummaryEvent.initialized(
          additionalDetailsStep: 3,
          maxSteps: 5,
          step: 0,
        ));
      },
      expect: () => [OrderSummaryState.initial().copyWith(maxSteps: 5)],
    );

    blocTest(
      'Order Summary Step Continue when it is in first step',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => OrderSummaryState.initial(),
      act: (OrderSummaryBloc bloc) {
        bloc.add(const OrderSummaryEvent.stepContinue());
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(step: 1),
      ],
    );

    blocTest(
      'Order Summary Step Continue when step is maxStep',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => OrderSummaryState.initial().copyWith(
        maxSteps: 4,
        step: 4,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(const OrderSummaryEvent.stepContinue());
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          step: 0,
          maxSteps: 4,
        ),
      ],
    );

    blocTest(
      'Order Summary Step Cancel when step is maxStep',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => OrderSummaryState.initial().copyWith(
        maxSteps: 4,
        step: 4,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(const OrderSummaryEvent.stepCancel());
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          step: 3,
          maxSteps: 4,
        ),
      ],
    );

    blocTest(
      'Order Summary Step Cancel when step is not a valid step',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => OrderSummaryState.initial().copyWith(maxSteps: 4, step: -1),
      act: (OrderSummaryBloc bloc) {
        bloc.add(const OrderSummaryEvent.stepCancel());
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          step: 0,
          maxSteps: 4,
        ),
      ],
    );

    blocTest(
      'Order Summary Step Cancel when step is maxStep',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => OrderSummaryState.initial().copyWith(
        maxSteps: 4,
        step: 4,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(const OrderSummaryEvent.stepCancel());
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          step: 3,
          maxSteps: 4,
        ),
      ],
    );

    blocTest(
      'Order Summary step tapped',
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      seed: () => OrderSummaryState.initial().copyWith(maxSteps: 4),
      act: (OrderSummaryBloc bloc) {
        bloc.add(const OrderSummaryEvent.stepTapped(step: 3));
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          step: 3,
          maxSteps: 4,
        ),
      ],
    );

    blocTest(
      'Order Summary submit order success',
      setUp: () {
        when(() => orderRepositoryMock.submitOrder(
              shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
              user:
                  User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
              cartItems: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  quantity: 2,
                )
              ],
              grandTotal: 100.0,
              customerCodeInfo:
                  CustomerCodeInfo.empty().copyWith(division: 'div'),
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2601')),
              data: {},
              orderType: '',
              configs: SalesOrganisationConfigs.empty()
                  .copyWith(currency: Currency('PHP')),
            )).thenAnswer((value) async => Right(submitOrderResponse));
      },
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            user: User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
            cartItems: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            data: {},
            orderType: '',
            config: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('PHP')),
          ),
        );
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isSubmitting: true,
          isSubmitSuccess: false,
        ),
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isSubmitting: false,
          isSubmitSuccess: true,
          submitOrderResponse: submitOrderResponse,
        ),
      ],
    );

    blocTest(
      'Order Summary submit order failure',
      setUp: () {
        when(() => orderRepositoryMock.submitOrder(
                  shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
                  user: User.empty()
                      .copyWith(email: EmailAddress('awsib@gmail.com')),
                  cartItems: <PriceAggregate>[
                    PriceAggregate.empty().copyWith(
                      quantity: 2,
                    )
                  ],
                  grandTotal: 100.0,
                  customerCodeInfo:
                      CustomerCodeInfo.empty().copyWith(division: 'div'),
                  salesOrganisation: SalesOrganisation.empty()
                      .copyWith(salesOrg: SalesOrg('2601')),
                  data: {},
                  orderType: '',
                  configs: SalesOrganisationConfigs.empty()
                      .copyWith(currency: Currency('PHP')),
                ))
            .thenAnswer(
                (value) async => const Left(ApiFailure.other('Some Error')));
      },
      build: () => OrderSummaryBloc(repository: orderRepositoryMock),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            shipToInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            user: User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
            cartItems: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            data: {},
            orderType: '',
            config: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('PHP')),
          ),
        );
      },
      expect: () => [
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isSubmitting: true,
          isSubmitSuccess: false,
        ),
        OrderSummaryState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
          isSubmitting: false,
          isSubmitSuccess: false,
        ),
      ],
    );
  });
}
