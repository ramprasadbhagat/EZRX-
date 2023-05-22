import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/payment_methods_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PaymentMethodsRepositoryMock extends Mock
    implements PaymentMethodsRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late PaymentMethodsRepository paymentMethodsRepositoryMock;
  late List<AvailablePaymentMethod> availablePaymentMethods;

  group(
    'Payment Methods Bloc Testing',
    () {
      setUp(() async {
        paymentMethodsRepositoryMock = PaymentMethodsRepositoryMock();
        availablePaymentMethods =
            await PaymentMethodsLocalDataSource().getAvailablePaymentMethods();
      });
      blocTest<PaymentMethodsBloc, PaymentMethodsState>(
        'For "initialized" Event',
        build: () => PaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(const PaymentMethodsEvent.initialized()),
        expect: () => [PaymentMethodsState.initial()],
      );

      blocTest<PaymentMethodsBloc, PaymentMethodsState>(
        'For "fetch" Event with Success',
        setUp: () => when(
                () => paymentMethodsRepositoryMock.getAvailablePaymentMethods())
            .thenAnswer(
          (invocation) async => Right(availablePaymentMethods),
        ),
        build: () => PaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(const PaymentMethodsEvent.fetch()),
        expect: () => [
          PaymentMethodsState.initial().copyWith(
            isFetching: true,
          ),
          PaymentMethodsState.initial().copyWith(
            isFetching: false,
            paymentMethodList: availablePaymentMethods,
          ),
        ],
      );

      blocTest<PaymentMethodsBloc, PaymentMethodsState>(
        'For "fetch" Event with Failure',
        setUp: () => when(
                () => paymentMethodsRepositoryMock.getAvailablePaymentMethods())
            .thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        ),
        build: () => PaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(const PaymentMethodsEvent.fetch()),
        expect: () => [
          PaymentMethodsState.initial().copyWith(
            isFetching: true,
          ),
          PaymentMethodsState.initial().copyWith(
            isFetching: false,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake Error'),
              ),
            ),
          ),
        ],
      );
    },
  );
}
