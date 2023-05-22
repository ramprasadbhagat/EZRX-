import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
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
  late EditPaymentMethod editPaymentMethods;
  late DeletePaymentMethod deletePaymentMethods;

  group(
    'Payment Methods Bloc Testing',
    () {
      setUp(() async {
        paymentMethodsRepositoryMock = PaymentMethodsRepositoryMock();
        editPaymentMethods =
            await PaymentMethodsLocalDataSource().updatePaymentMethods();
        deletePaymentMethods =
            await PaymentMethodsLocalDataSource().deletePaymentMethods();
      });
      blocTest<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
        'For "newPaymentMethodChanged" Event',
        build: () => ManagePaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManagePaymentMethodsEvent.newPaymentMethodChanged(
            paymentMethod: 'test',
          ),
        ),
        expect: () => [
          ManagePaymentMethodsState.initial().copyWith(
            paymentMethod: PaymentMethod('test'),
          ),
        ],
      );

      blocTest<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
        'For "editPaymentMethod" Event with success',
        seed: () => ManagePaymentMethodsState.initial().copyWith(
          paymentMethod: PaymentMethod('new-method'),
        ),
        setUp: () => when(
          () => paymentMethodsRepositoryMock.updatePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('method'),
            newPaymentMethod: PaymentMethod('new-method'),
          ),
        ).thenAnswer(
          (invocation) async => Right(editPaymentMethods),
        ),
        build: () => ManagePaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentMethodsEvent.editPaymentMethod(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('method'),
          ),
        ),
        expect: () => [
          ManagePaymentMethodsState.initial().copyWith(
            isSubmitting: true,
            paymentMethod: PaymentMethod('new-method'),
          ),
          ManagePaymentMethodsState.initial(),
        ],
      );

      blocTest<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
        'For "editPaymentMethod" Event with Failure',
        seed: () => ManagePaymentMethodsState.initial().copyWith(
          paymentMethod: PaymentMethod('new-method'),
        ),
        setUp: () => when(
          () => paymentMethodsRepositoryMock.updatePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('method'),
            newPaymentMethod: PaymentMethod('new-method'),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        ),
        build: () => ManagePaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentMethodsEvent.editPaymentMethod(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('method'),
          ),
        ),
        expect: () => [
          ManagePaymentMethodsState.initial().copyWith(
            isSubmitting: true,
            paymentMethod: PaymentMethod('new-method'),
          ),
          ManagePaymentMethodsState.initial().copyWith(
            paymentMethod: PaymentMethod('new-method'),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
        'For "editPaymentMethod" Event with validation failure',
        build: () => ManagePaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentMethodsEvent.editPaymentMethod(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('method'),
          ),
        ),
        expect: () => [
          ManagePaymentMethodsState.initial(),
          ManagePaymentMethodsState.initial().copyWith(
            showErrorMessages: true,
          ),
        ],
      );

      blocTest<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
        'For "deletePaymentMethod" Event with success',
        setUp: () => when(
          () => paymentMethodsRepositoryMock.deletePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
          ),
        ).thenAnswer(
          (invocation) async => Right(deletePaymentMethods),
        ),
        build: () => ManagePaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentMethodsEvent.deletePaymentMethod(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
            deleteIndex: 6,
          ),
        ),
        expect: () => [
          ManagePaymentMethodsState.initial().copyWith(
            isSubmitting: true,
            deleteIndex: 6,
          ),
          ManagePaymentMethodsState.initial().copyWith(
            isSubmitting: false,
            deleteIndex: -1,
          ),
        ],
      );

      blocTest<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
        'For "deletePaymentMethod" Event with failure',
        setUp: () => when(
          () => paymentMethodsRepositoryMock.deletePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        ),
        build: () => ManagePaymentMethodsBloc(
          paymentMethodsRepository: paymentMethodsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentMethodsEvent.deletePaymentMethod(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
            deleteIndex: 6,
          ),
        ),
        expect: () => [
          ManagePaymentMethodsState.initial().copyWith(
            isSubmitting: true,
            deleteIndex: 6,
          ),
          ManagePaymentMethodsState.initial().copyWith(
            isSubmitting: false,
            deleteIndex: -1,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
    },
  );
}
