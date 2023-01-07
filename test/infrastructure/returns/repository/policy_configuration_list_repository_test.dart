import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_list_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/policy_configuration_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class PolicyConfigurationLocalDataSourceMock extends Mock
    implements PolicyConfigurationLocalDataSource {}

class PolicyConfigurationRemoteDataSourceMock extends Mock
    implements PolicyConfigurationRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late PolicyConfigurationRepository policyConfigurationRepo;
  late Config mockConfig;
  final mockSalesOrg = SalesOrganisation(
    customerInfos: <SalesOrgCustomerInfo>[],
    salesOrg: SalesOrg('2601'),
  );
  late PolicyConfigurationLocalDataSource policyConfigurationLocalSource;
  late PolicyConfigurationRemoteDataSource policyConfigurationRemoteSource;
  late CountlyService countlyService;
  final policyConfigurationListMock = [
    const PolicyConfigurationList(
      salesOrg: '2601',
      principalCode: '2601',
      monthsBeforeExpiry: '"0',
      monthsAfterExpiry: '"0',
      uuid: 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
      returnsAllowed: true,
      principalName: '',
    ),
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    policyConfigurationLocalSource = PolicyConfigurationLocalDataSourceMock();
    policyConfigurationRemoteSource = PolicyConfigurationRemoteDataSourceMock();
    countlyService = CountlyServiceMock();
    policyConfigurationRepo = PolicyConfigurationRepository(
      config: mockConfig,
      localDataSource: policyConfigurationLocalSource,
      remoteDataSource: policyConfigurationRemoteSource,
      countlyService: countlyService,
    );
  });

  group('PolicyConfigurationRepository Test', () {
    test('=> getPolicyConfigurationList Locally SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => policyConfigurationLocalSource.getPolicyConfigurationList())
          .thenAnswer((invocation) async => policyConfigurationListMock);

      final result = await policyConfigurationRepo.getPolicyConfigurationList(
        salesOrganisation: mockSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getPolicyConfigurationList Locally FAILED', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => policyConfigurationLocalSource.getPolicyConfigurationList())
          .thenThrow(const ApiFailure.serverTimeout());

      final result = await policyConfigurationRepo.getPolicyConfigurationList(
        salesOrganisation: mockSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> getPolicyConfigurationList Remote SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => policyConfigurationRemoteSource.getPolicyConfigurationList(
              salesOrg: mockSalesOrg.salesOrg.getOrCrash()))
          .thenAnswer((invocation) async => policyConfigurationListMock);

      final result = await policyConfigurationRepo.getPolicyConfigurationList(
        salesOrganisation: mockSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getPolicyConfigurationList Remote FAILED', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => policyConfigurationRemoteSource.getPolicyConfigurationList(
            salesOrg: mockSalesOrg.salesOrg.getOrDefaultValue('')),
      ).thenThrow(const ApiFailure.serverTimeout());

      final result = await policyConfigurationRepo.getPolicyConfigurationList(
        salesOrganisation: mockSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
