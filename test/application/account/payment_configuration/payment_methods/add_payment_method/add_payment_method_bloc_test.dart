import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/payment_methods_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PaymentMethodsRepositoryMock extends Mock
    implements PaymentMethodsRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late PaymentMethodsRepository paymentMethodsRepositoryMock;
  late EditPaymentMethod addPaymentMethods;

  group(
    'Payment Methods Bloc Testing',
    () {
      setUp(() async {
        paymentMethodsRepositoryMock = PaymentMethodsRepositoryMock();
        addPaymentMethods =
            await PaymentMethodsLocalDataSource().updatePaymentMethods();
      });
      blocTest<AddPaymentMethodBloc, AddPaymentMethodState>(
        'For "initialized" Event',
        build: () => AddPaymentMethodBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const AddPaymentMethodEvent.initialized(),
        ),
        expect: () => [AddPaymentMethodState.initial()],
      );

      blocTest<AddPaymentMethodBloc, AddPaymentMethodState>(
        'For "paymentMethodChanged" Event',
        build: () => AddPaymentMethodBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const AddPaymentMethodEvent.paymentMethodChanged(
            paymentMethod: 'payment method',
          ),
        ),
        expect: () => [
          AddPaymentMethodState.initial().copyWith(
            paymentMethod: PaymentMethod('payment method'),
          ),
        ],
      );

      blocTest<AddPaymentMethodBloc, AddPaymentMethodState>(
        'For "salesOrgChanged" Event',
        build: () => AddPaymentMethodBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const AddPaymentMethodEvent.salesOrgChanged(salesOrg: '2900'),
        ),
        expect: () => [
          AddPaymentMethodState.initial().copyWith(
            salesOrg: SalesOrg('2900'),
          ),
        ],
      );

      blocTest<AddPaymentMethodBloc, AddPaymentMethodState>(
        'For "addPaymentMethod" Event with success',
        seed: () => AddPaymentMethodState.initial().copyWith(
          salesOrg: SalesOrg('2900'),
          paymentMethod: PaymentMethod('new-method'),
        ),
        setUp: () => when(
          () => paymentMethodsRepositoryMock.updatePaymentMethods(
            salesOrg: SalesOrg('2900'),
            oldPaymentMethod: PaymentMethod(''),
            newPaymentMethod: PaymentMethod('new-method'),
          ),
        ).thenAnswer(
          (invocation) async => Right(addPaymentMethods),
        ),
        build: () => AddPaymentMethodBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const AddPaymentMethodEvent.addPaymentMethod(),
        ),
        expect: () => [
          AddPaymentMethodState.initial().copyWith(
            salesOrg: SalesOrg('2900'),
            paymentMethod: PaymentMethod('new-method'),
            isSubmitting: true,
          ),
          AddPaymentMethodState.initial().copyWith(
            isSubmitting: false,
            salesOrg: SalesOrg(''),
            paymentMethod: PaymentMethod(''),
          ),
        ],
      );

      blocTest<AddPaymentMethodBloc, AddPaymentMethodState>(
        'For "addPaymentMethod" Event with failure',
        seed: () => AddPaymentMethodState.initial().copyWith(
          salesOrg: SalesOrg('2900'),
          paymentMethod: PaymentMethod('new-method'),
        ),
        setUp: () => when(
          () => paymentMethodsRepositoryMock.updatePaymentMethods(
            salesOrg: SalesOrg('2900'),
            oldPaymentMethod: PaymentMethod(''),
            newPaymentMethod: PaymentMethod('new-method'),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        ),
        build: () => AddPaymentMethodBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const AddPaymentMethodEvent.addPaymentMethod(),
        ),
        expect: () => [
          AddPaymentMethodState.initial().copyWith(
            salesOrg: SalesOrg('2900'),
            paymentMethod: PaymentMethod('new-method'),
            isSubmitting: true,
          ),
          AddPaymentMethodState.initial().copyWith(
            isSubmitting: false,
            salesOrg: SalesOrg('2900'),
            paymentMethod: PaymentMethod('new-method'),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest<AddPaymentMethodBloc, AddPaymentMethodState>(
        'For "addPaymentMethod" Event with validation error',
        build: () => AddPaymentMethodBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const AddPaymentMethodEvent.addPaymentMethod(),
        ),
        expect: () => [
          AddPaymentMethodState.initial(),
          AddPaymentMethodState.initial().copyWith(
            showErrorMessages: true,
          ),
        ],
      );
    },
  );
}
