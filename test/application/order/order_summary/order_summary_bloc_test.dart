import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

void main() {
  late OrderRepository orderRepositoryMock;
  group(
    'Test Order Summary Bloc',
    () {
      setUp(
        () {
          orderRepositoryMock = OrderRepositoryMock();
        },
      );
      blocTest<OrderSummaryBloc, OrderSummaryState>(
        '==> Initialize and Navigate Stepper',
        build: () => OrderSummaryBloc(repository: orderRepositoryMock),
        act: (bloc) => bloc
          ..add(const OrderSummaryEvent.initialized())
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
    },
  );
}
