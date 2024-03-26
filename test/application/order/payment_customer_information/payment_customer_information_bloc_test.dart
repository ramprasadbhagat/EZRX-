import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_customer_information_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PaymentCustomerInfoRepoMock extends Mock
    implements PaymentCustomerInformationRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentCustomerInformationRepository
      paymentCustomerInformationRepositoryMock;
  late PaymentCustomerInformation paymentCustomerInformationMockData;

  late SalesOrganisation fakeSaleOrganisation;

  late CustomerCodeInfo fakeCustomerCodeInfo;

  late String fakeshipToCustomerCode;
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    paymentCustomerInformationRepositoryMock = PaymentCustomerInfoRepoMock();
    fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
      customerCodeSoldTo: 'fake-1234',
    );
    fakeSaleOrganisation = SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('fake-1234'),
    );
    fakeshipToCustomerCode = 'fake-1234';
  });

  group('Payment Customer Information Bloc', () {
    setUp(() async {
      paymentCustomerInformationMockData =
          await PaymentCustomerInformationLocalDataSource()
              .getPaymentCustomerInformation();
    });
    blocTest<PaymentCustomerInformationBloc, PaymentCustomerInformationState>(
      'For Customer Information Initialized Event',
      build: () => PaymentCustomerInformationBloc(
        paymentCustomerInformationRepository:
            paymentCustomerInformationRepositoryMock,
      ),
      act: (bloc) =>
          bloc.add(const PaymentCustomerInformationEvent.initialized()),
      expect: () => [PaymentCustomerInformationState.initial()],
    );

    blocTest<PaymentCustomerInformationBloc, PaymentCustomerInformationState>(
      'Payment Customer Information Fetch fail',
      build: () => PaymentCustomerInformationBloc(
        paymentCustomerInformationRepository:
            paymentCustomerInformationRepositoryMock,
      ),
      setUp: () {
        when(
          () => paymentCustomerInformationRepositoryMock
              .getPaymentCustomerInformation(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSaleOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        PaymentCustomerInformationEvent.fetch(
          customeCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrganisation,
          selectedShipToCode: fakeshipToCustomerCode,
        ),
      ),
      expect: () => [
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: const PaymentCustomerInformation(
            billToInfo: <BillToInfo>[],
            paymentTerm: '',
            shipToInfoList: <ShipToInfo>[],
          ),
          paymentCustomerInformationFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest<PaymentCustomerInformationBloc, PaymentCustomerInformationState>(
      'Payment Customer Information Fetch success',
      build: () => PaymentCustomerInformationBloc(
        paymentCustomerInformationRepository:
            paymentCustomerInformationRepositoryMock,
      ),
      setUp: () {
        when(
          () => paymentCustomerInformationRepositoryMock
              .getPaymentCustomerInformation(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSaleOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentCustomerInformationMockData),
        );
      },
      act: (bloc) => bloc.add(
        PaymentCustomerInformationEvent.fetch(
          customeCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrganisation,
          selectedShipToCode: fakeshipToCustomerCode,
        ),
      ),
      expect: () => [
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: paymentCustomerInformationMockData,
          paymentCustomerInformationFailureOrSuccessOption: none(),
        ),
      ],
    );

    // blocTest<PaymentCustomerInformationBloc, PaymentCustomerInformationState>(
    //   'Payment Customer Information Fetch success with license list',
    //   build: () => PaymentCustomerInformationBloc(
    //     paymentCustomerInformationRepository:
    //         paymentCustomerInformationRepositoryMock,
    //   ),
    //   setUp: () {
    //     when(
    //       () => paymentCustomerInformationRepositoryMock
    //           .getPaymentCustomerInformation(
    //         customerCodeInfo: fakeCustomerCodeInfo,
    //         salesOrganisation: fakeSaleOrganisation,
    //       ),
    //     ).thenAnswer(
    //       (invocation) async => Right(paymentCustomerInformationMockData),
    //     );
    //   },
    //   act: (bloc) => bloc.add(
    //     PaymentCustomerInformationEvent.fetch(
    //       customeCodeInfo: fakeCustomerCodeInfo,
    //       salesOrganisation: fakeSaleOrganisation,
    //       selectedShipToCode: '0070149863',
    //     ),
    //   ),
    //   expect: () => [
    //     PaymentCustomerInformationState.initial().copyWith(
    //       paymentCustomerInformation: paymentCustomerInformationMockData,
    //       licenses: paymentCustomerInformationMockData.shipToInfoList
    //           .where((element) => element.shipToCustomerCode == '0070149863')
    //           .first
    //           .licenses,
    //       paymentCustomerInformationFailureOrSuccessOption: none(),
    //     )
    //   ],
    // );

    // test(
    //   '=> Test getLicensesType getter',
    //   () {
    //     final licensesType = PaymentCustomerInformationState.initial()
    //         .copyWith(
    //           licenses: paymentCustomerInformationMockData.shipToInfoList
    //               .where(
    //                 (element) => element.shipToCustomerCode == '0070149863',
    //               )
    //               .first
    //               .licenses,
    //         )
    //         .getLicensesType;
    //     expect(licensesType, 'R03');
    //   },
    // );
  });
}
