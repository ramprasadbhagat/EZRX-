import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_license_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class CustomerLicenseRepositoryMock extends Mock
    implements CustomerLicenseRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final CustomerLicenseRepository customerLicenseRepo =
      CustomerLicenseRepositoryMock();
  late Config config;
  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code'),
      shipToInfos: [],
    ),
  ];

  final fakeShipToInfo = ShipToInfo.empty()
      .copyWith(building: 'fakeBuilding', shipToCustomerCode: '123');
  final fakeBillToInfo =
      BillToInfo.empty().copyWith(billToCustomerCode: 'customer1234');
  final fakeCustomerInfo = CustomerCodeInfo.empty().copyWith(
    shipToInfos: [fakeShipToInfo],
    billToInfos: [fakeBillToInfo],
    customerCodeSoldTo: 'customer123',
  );

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(type: RoleType('client')),
  );
  final fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: fakeSalesOrgCustomerInfos,
  );

  const apiFailure = ApiFailure.other('fake-error');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    config = Config()..appFlavor = Flavor.mock;
  });

  group('Customer License Bloc', () {
    blocTest(
      'Customer code Initial',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeSaleOrg,
            customerCode: fakeCustomerInfo,
            user: fakeUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(apiFailure),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          CustomerLicenseEvent.initialized(
            salesOrganization: fakeSaleOrg,
            customerInfo: fakeCustomerInfo,
            user: fakeUser,
          ),
        );
      },
      verify: (CustomerLicenseBloc bloc) {
        expect(
          bloc.state.salesOrganization,
          fakeSaleOrg,
        );
        expect(
          bloc.state.customerInfo,
          fakeCustomerInfo,
        );
        expect(
          bloc.state.user,
          fakeUser,
        );
      },
    );

    blocTest(
      'Customer License Fetch fail',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeSaleOrg,
        customerInfo: fakeCustomerInfo,
        user: fakeUser,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeSaleOrg,
            customerCode: fakeCustomerInfo,
            user: fakeUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(apiFailure),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.fetch(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: true,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer License Fetch success',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeSaleOrg,
        customerInfo: fakeCustomerInfo,
        user: fakeUser,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeSaleOrg,
            customerCode: fakeCustomerInfo,
            user: fakeUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => Right([
            CustomerLicense(
              licenseNumbers: StringValue('fake1'),
              licenseType: StringValue('fake2'),
              licenseDescription: StringValue('fake3'),
              validFrom: DateTimeStringValue('fake4'),
              validTo: DateTimeStringValue('fake4'),
              status: StatusType('fake5'),
            ),
          ]),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.fetch(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          customerLicenses: [
            CustomerLicense(
              licenseNumbers: StringValue('fake1'),
              licenseType: StringValue('fake2'),
              licenseDescription: StringValue('fake3'),
              validFrom: DateTimeStringValue('fake4'),
              validTo: DateTimeStringValue('fake4'),
              status: StatusType('fake5'),
            ),
          ],
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer License Load more success',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeSaleOrg,
        customerInfo: fakeCustomerInfo,
        user: fakeUser,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeSaleOrg,
            customerCode: fakeCustomerInfo,
            user: fakeUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => Right([
            CustomerLicense(
              licenseNumbers: StringValue('fake1'),
              licenseType: StringValue('fake2'),
              licenseDescription: StringValue('fake3'),
              validFrom: DateTimeStringValue('fake4'),
              validTo: DateTimeStringValue('fake4'),
              status: StatusType('fake5'),
            ),
          ]),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.loadMore(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          customerLicenses: [
            CustomerLicense(
              licenseNumbers: StringValue('fake1'),
              licenseType: StringValue('fake2'),
              licenseDescription: StringValue('fake3'),
              validFrom: DateTimeStringValue('fake4'),
              validTo: DateTimeStringValue('fake4'),
              status: StatusType('fake5'),
            ),
          ],
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer License Load more fail',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeSaleOrg,
        customerInfo: fakeCustomerInfo,
        user: fakeUser,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeSaleOrg,
            customerCode: fakeCustomerInfo,
            user: fakeUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(apiFailure),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.loadMore(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeSaleOrg,
          customerInfo: fakeCustomerInfo,
          user: fakeUser,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: true,
          isFetching: false,
        ),
      ],
    );
  });
}
