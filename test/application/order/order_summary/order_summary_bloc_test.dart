import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderRepository orderRepositoryMock;

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
  });
}
