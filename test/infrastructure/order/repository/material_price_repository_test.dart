import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MaterialPriceLocalDataSourceMock extends Mock
    implements MaterialPriceLocalDataSource {}

class MaterialPriceRemoteDataSourceMock extends Mock
    implements MaterialPriceRemoteDataSource {}

void main() {
  late MaterialPriceRepository materialPriceRepository;
  late Config mockConfig;
  late MaterialPriceLocalDataSource materialPriceLocalDataSource;
  late MaterialPriceRemoteDataSource materialPriceRemoteDataSource;

  final mockSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-name'),
  );

  final mockCustomerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');

  final mockSalesConfigs = SalesOrganisationConfigs.empty();
  final mockShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-ship-code',
  );
  final fakeMaterialNumberQuery = [
    MaterialNumber('1'),
    MaterialNumber('2'),
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    materialPriceLocalDataSource = MaterialPriceLocalDataSourceMock();
    materialPriceRemoteDataSource = MaterialPriceRemoteDataSourceMock();

    materialPriceRepository = MaterialPriceRepository(
      config: mockConfig,
      localDataSource: materialPriceLocalDataSource,
      remoteDataSource: materialPriceRemoteDataSource,
    );
  });

  group('materialPriceRepository should - ', () {
    test('get materialPrice successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[]);

      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: mockSalesConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialPrice fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList())
          .thenThrow((invocation) async => MockException());
      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: mockSalesConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialPrice successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => materialPriceRemoteDataSource.getMaterialPriceList(
          salesOrgCode: 'fake-name',
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-code',
          materialNumbers: [],
        ),
      ).thenAnswer((invocation) async => <Price>[]);

      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: mockSalesConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialPrice fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => materialPriceRemoteDataSource.getMaterialPriceList(
          salesOrgCode: '23456700',
          customerCode: '',
          materialNumbers: [],
          shipToCode: 'fake-ship-code',
        ),
      ).thenThrow((invocation) async => MockException());
      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo.copyWith(customerCodeSoldTo: ''),
        salesOrganisation:
            mockSalesOrganisation.copyWith(salesOrg: SalesOrg('')),
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: mockSalesConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });

  test('get materialPrice successfully', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
    when(
      () => materialPriceRemoteDataSource.getMaterialPrice(
        salesOrgCode: 'fake-name',
        customerCode: 'fake-customer-code',
        shipToCode: 'fake-ship-code',
        materialNumber: 'fake-number',
        salesDeal: [],
      ),
    ).thenAnswer(
      (invocation) async => Price.empty().copyWith(
        finalPrice: MaterialPrice(123),
      ),
    );

    final result = await materialPriceRepository.getMaterialPrice(
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      materialNumberList: [MaterialNumber('fake-number')],
      salesConfigs: mockSalesConfigs,
      shipToInfo: mockShipToInfo,
      comboDealEligible: false,
    );
    expect(
      result.isRight(),
      true,
    );
  });

  test('get getMaterialPriceForZDP5 successfully', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => materialPriceRemoteDataSource.getMaterialPriceForZDP5(
        salesOrgCode: 'fake-name',
        customerCode: 'fake-customer-code',
        shipToCode: 'fake-ship-code',
        materialNumber: 'fake-number',
        exceedQty: true,
      ),
    ).thenAnswer(
      (invocation) async => Price.empty().copyWith(
        finalPrice: MaterialPrice(123),
        exceedQty: true,
      ),
    );

    final result =
        await materialPriceRepository.getMaterialPriceForZDP5Material(
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      materialNumber: MaterialNumber('fake-number'),
      salesConfigs: mockSalesConfigs,
      shipToInfo: mockShipToInfo,
      exceedQty: true,
    );
    expect(
      result.isRight(),
      true,
    );
  });

  test('get getMaterialPriceForZDP5 failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => materialPriceRemoteDataSource.getMaterialPriceForZDP5(
        salesOrgCode: 'fake-name',
        customerCode: 'fake-customer-code',
        shipToCode: 'fake-ship-code',
        materialNumber: 'fake-number',
        exceedQty: true,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result =
        await materialPriceRepository.getMaterialPriceForZDP5Material(
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      materialNumber: MaterialNumber('fake-number'),
      salesConfigs: mockSalesConfigs,
      shipToInfo: mockShipToInfo,
      exceedQty: true,
    );
    expect(
      result.isLeft(),
      true,
    );
  });
}
