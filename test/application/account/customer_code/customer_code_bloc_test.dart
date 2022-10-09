import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CustomerCodeMockRepo extends Mock implements CustomerCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late List<CustomerCodeInfo> customerMockData;
  final CustomerCodeRepository customerCodeMockRepo = CustomerCodeMockRepo();

  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
        customerCodeSoldTo: CustomerCode('fake-customer-code'), shipToInfos: [])
  ];

  final fakeShipToInfo = ShipToInfo.empty().copyWith(building: 'fakeBuilding');
  final fakeCustomerInfo =
      CustomerCodeInfo.empty().copyWith(shipToInfos: [fakeShipToInfo]);
  final fakeUser = User.empty().copyWith(
      username: Username('fake-user'),
      role: Role.empty().copyWith(type: RoleType('client')));
  final fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: fakeSalesOrgCustomerInfos,
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    customerMockData =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
  });

  group('Customer Code Bloc', () {
    blocTest('Customer code Initial',
        build: () =>
            CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
        act: (CustomerCodeBloc bloc) {
          bloc.add(const CustomerCodeEvent.initialized());
        },
        expect: () => [CustomerCodeState.initial()]);

    blocTest('Customer Code Selected',
        build: () =>
            CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
        act: (CustomerCodeBloc bloc) {
          bloc.add(
              CustomerCodeEvent.selected(customerCodeInfo: fakeCustomerInfo));
        },
        expect: () => [
              CustomerCodeState.initial()
                  .copyWith(customeCodeInfo: fakeCustomerInfo)
            ]);

    blocTest(
      'Customer Code Fetch fail',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              fakeSaleOrg,
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
              false,
              0,
              fakeUser,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.fetch(
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg));
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          customerCodeList: [],
          customeCodeInfo: CustomerCodeInfo.empty(),
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer Code Fetch Success',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
            fakeSaleOrg,
            fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            false,
            0,
            fakeUser)).thenAnswer(
          (invocation) async => Right(
            customerMockData,
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.fetch(
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg));
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customeCodeInfo: customerMockData.first,
          customerCodeList: customerMockData,
          apiFailureOrSuccessOption: none(),
          canLoadMore: false,
        ),
      ],
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        customerMockData,
      ),
    );

    test('Check if state does not have DefaultShipToInfo', () {
      final customerCodeState = CustomerCodeState.initial();
      expect(customerCodeState.haveShipToInfo, false);
      expect(customerCodeState.defaultShipToInfo, null);
    });

    test('Check if state has DefaultShipToInfo in first index', () {
      final customerCodeState = CustomerCodeState.initial()
          .copyWith(customeCodeInfo: fakeCustomerInfo);
      expect(customerCodeState.defaultShipToInfo, fakeShipToInfo);
    });

    test('Check if state has DefaultShipToInfo in predefined index', () {
      final customerCodeState = CustomerCodeState.initial().copyWith(
          customeCodeInfo: fakeCustomerInfo.copyWith(shipToInfos: [
        fakeShipToInfo,
        fakeShipToInfo.copyWith(
            building: 'fakeBuilding2', defaultShipToAddress: true)
      ]));
      expect(
          customerCodeState.defaultShipToInfo,
          fakeShipToInfo.copyWith(
              building: 'fakeBuilding2', defaultShipToAddress: true));
    });
  });
}
