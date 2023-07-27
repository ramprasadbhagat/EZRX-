import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_item/payment_item_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_item_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PaymentItemRepositoryMock extends Mock implements PaymentItedmRepository {}

class PaymentItemBlocMock extends MockBloc<
        PaymentItemEvent, PaymentItemState>
    implements PaymentItemBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentItedmRepository paymentItemRepositoryMock;
  late List<PaymentItem> paymentItemMockData;

  final fakeSaleOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-1234'),
  );


  final fakeCustomerCode = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );


  group('Payment Item Bloc Test', () {
    setUp(() async {
      paymentItemRepositoryMock = PaymentItemRepositoryMock();
      paymentItemMockData =
          await PaymentItemLocalDataSource().getPaymentItems();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<PaymentItemBloc, PaymentItemState>(
      'Payment Items Fetch fail',
      build: () => PaymentItemBloc(
        paymentItemRepository: paymentItemRepositoryMock,
      ),
      setUp: () {
        when(() => paymentItemRepositoryMock.fetchPaymentItemList(
              customerCodeInfo: fakeCustomerCode,
              accountingDocExternalReference: 'fake-doc',
              paymentBatchAdditionalInfo: 'fake-info',
              paymentID: 'fake-id',
              salesOrganization: fakeSaleOrganisation,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(PaymentItemEvent.fetchPaymentItemList(
          accountingDocExternalReference: 'fake-doc',
          customerCodeInfo: fakeCustomerCode,
          paymentBatchAdditionalInfo: 'fake-info',
          paymentID: 'fake-id',
          salesOrganization: fakeSaleOrganisation
          )),
      expect: () => [
        PaymentItemState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentItemState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
    );
    blocTest<PaymentItemBloc, PaymentItemState>(
      'Payment Items Fetch success',
      build: () => PaymentItemBloc(
        paymentItemRepository: paymentItemRepositoryMock,
      ),
      setUp: () {
        when(() => paymentItemRepositoryMock.fetchPaymentItemList(
              customerCodeInfo: fakeCustomerCode,
              accountingDocExternalReference: 'fake-doc',
              paymentBatchAdditionalInfo: 'fake-info',
              paymentID: 'fake-id',
              salesOrganization: fakeSaleOrganisation,
            )).thenAnswer(
          (invocation) async => Right(paymentItemMockData),
        );
      },
      act: (bloc) => bloc.add(PaymentItemEvent.fetchPaymentItemList(
          accountingDocExternalReference: 'fake-doc',
          customerCodeInfo: fakeCustomerCode,
          paymentBatchAdditionalInfo: 'fake-info',
          paymentID: 'fake-id',
          salesOrganization: fakeSaleOrganisation
          )),
      expect: () => [
        PaymentItemState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentItemState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: none(),
          paymentItemList: paymentItemMockData,
        )
      ],
    );
  });
}
