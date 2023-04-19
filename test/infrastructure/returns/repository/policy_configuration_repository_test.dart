import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/policy_configuration_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class PolicyConfigurationLocalDataSourceMock extends Mock
    implements PolicyConfigurationLocalDataSource {}

class PolicyConfigurationRemoteDataSourceMock extends Mock
    implements PolicyConfigurationRemoteDataSource {}



void main() {
  late PolicyConfigurationRepository policyConfigurationRepo;
  late Config mockConfig;
  final mockSalesOrg = SalesOrganisation(
    customerInfos: <SalesOrgCustomerInfo>[],
    salesOrg: SalesOrg('2601'),
  );
  late PolicyConfigurationLocalDataSource policyConfigurationLocalSource;
  late PolicyConfigurationRemoteDataSource policyConfigurationRemoteSource;
  
  final policyConfigurationListMock = [
    PolicyConfiguration(
        salesOrg: SalesOrg('2601'),
        principalCode: PrincipalCode('2601'),
        monthsBeforeExpiry: MonthsBeforeExpiry.change('0'),
        monthsAfterExpiry: MonthsAfterExpiry.change('0'),
        uuid: 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
        returnsAllowed: ReturnsAllowed(true),
        principalName: PrincipalName(''),
        status: ''),
  ];
  final policyConfigurationMock = PolicyConfiguration(
      salesOrg: SalesOrg('2601'),
      principalCode: PrincipalCode('2601'),
      monthsBeforeExpiry: MonthsBeforeExpiry.change('0'),
      monthsAfterExpiry: MonthsAfterExpiry.change('0'),
      uuid: 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
      returnsAllowed: ReturnsAllowed(true),
      principalName: PrincipalName(''),
      status: '');

  setUpAll(() {
    mockConfig = MockConfig();
    policyConfigurationLocalSource = PolicyConfigurationLocalDataSourceMock();
    policyConfigurationRemoteSource = PolicyConfigurationRemoteDataSourceMock();
    
    policyConfigurationRepo = PolicyConfigurationRepository(
      config: mockConfig,
      localDataSource: policyConfigurationLocalSource,
      remoteDataSource: policyConfigurationRemoteSource,
    );
  });

  group('PolicyConfigurationRepository Test', () {
    test('=> getPolicyConfiguration Locally SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => policyConfigurationLocalSource.getPolicyConfiguration())
          .thenAnswer((invocation) async => policyConfigurationListMock);

      final result = await policyConfigurationRepo.getPolicyConfiguration(
        salesOrganisation: mockSalesOrg,
        offSet: 0,
        pageSize: 10,
        searchKey: SearchKey(''),
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getPolicyConfiguration Locally FAILED', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => policyConfigurationLocalSource.getPolicyConfiguration())
          .thenThrow(const ApiFailure.serverTimeout());

      final result = await policyConfigurationRepo.getPolicyConfiguration(
        salesOrganisation: mockSalesOrg,
        offSet: 0,
        pageSize: 10,
        searchKey: SearchKey(''),
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> getPolicyConfiguration Remote SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => policyConfigurationRemoteSource.getPolicyConfiguration(
              salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
              offSet: 0,
              pageSize: 10,
              searchKey: '',))
          .thenAnswer((invocation) async => policyConfigurationListMock);

      final result = await policyConfigurationRepo.getPolicyConfiguration(
        salesOrganisation: mockSalesOrg,
        offSet: 0,
        pageSize: 10,
        searchKey: SearchKey(''),
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getPolicyConfiguration Remote FAILED', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => policyConfigurationRemoteSource.getPolicyConfiguration(
            salesOrg: mockSalesOrg.salesOrg.getOrDefaultValue(''),
            offSet: 0,
            pageSize: 10,
            searchKey: '',),
      ).thenThrow(const ApiFailure.serverTimeout());

      final result = await policyConfigurationRepo.getPolicyConfiguration(
        salesOrganisation: mockSalesOrg,
        offSet: 0,
        pageSize: 10,
        searchKey: SearchKey(''),
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> getDeletePolicy Locally SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = await policyConfigurationRepo.getDeletePolicy(
        policyConfigurationItem: policyConfigurationMock,
        policyConfigurationList: policyConfigurationListMock,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getDeletePolicy Remote SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => policyConfigurationRemoteSource.getDeletePolicyConfiguration(
              policyConfiguration: policyConfigurationMock))
          .thenAnswer((invocation) async => policyConfigurationMock);

      final result = await policyConfigurationRepo.getDeletePolicy(
        policyConfigurationItem: policyConfigurationMock,
        policyConfigurationList: policyConfigurationListMock,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getDeletePolicy Remote FAILED', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => policyConfigurationRemoteSource.getDeletePolicyConfiguration(
            policyConfiguration: policyConfigurationMock),
      ).thenThrow(const ApiFailure.serverTimeout());

      final result = await policyConfigurationRepo.getDeletePolicy(
        policyConfigurationItem: policyConfigurationMock,
        policyConfigurationList: policyConfigurationListMock,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> getAddPolicy Locally SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = await policyConfigurationRepo.getAddPolicy(
          policyConfigurationItems: policyConfigurationMock,
          policyConfigurationList: policyConfigurationListMock);
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getAddPolicy Remote SUCCESS', () async {
      final policyConfiguration = PolicyConfiguration.empty().copyWith(
        salesOrg: SalesOrg(policyConfigurationMock.salesOrg.getOrCrash()),
        principalCode: policyConfigurationMock.principalCode,
        monthsBeforeExpiry: policyConfigurationMock.monthsBeforeExpiry,
        monthsAfterExpiry: policyConfigurationMock.monthsAfterExpiry,
        returnsAllowed:
            ReturnsAllowed(policyConfigurationMock.returnsAllowed.getOrCrash()),
      );

      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => policyConfigurationRemoteSource.geAddPolicyConfiguration(
              policyConfiguration: policyConfiguration))
          .thenAnswer((invocation) async => policyConfigurationMock);

      final result = await policyConfigurationRepo.getAddPolicy(
          policyConfigurationItems: policyConfiguration,
          policyConfigurationList: policyConfigurationListMock);

      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getAddPolicy Remote FAILED', () async {
      final policyConfiguration = PolicyConfiguration.empty().copyWith(
        salesOrg: SalesOrg(policyConfigurationMock.salesOrg.getOrCrash()),
        principalCode: policyConfigurationMock.principalCode,
        monthsBeforeExpiry: policyConfigurationMock.monthsBeforeExpiry,
        monthsAfterExpiry: policyConfigurationMock.monthsAfterExpiry,
        returnsAllowed:
            ReturnsAllowed(policyConfigurationMock.returnsAllowed.getOrCrash()),
      );

      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => policyConfigurationRemoteSource.geAddPolicyConfiguration(
              policyConfiguration: policyConfiguration))
          .thenThrow(const ApiFailure.serverTimeout());

      final result = await policyConfigurationRepo.getAddPolicy(
          policyConfigurationItems: policyConfiguration,
          policyConfigurationList: policyConfigurationListMock);

      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
