import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class TenderContractLocalDataSourceMock extends Mock
    implements TenderContractLocalDataSource {}

class TenderContractRemoteDataSourceMock extends Mock
    implements TenderContractRemoteDataSource {}


void main() {
  late TenderContractRepository tenderContractRepository;
  late Config mockConfig;
  late TenderContractLocalDataSource tenderContractLocalDataSource;
  late TenderContractRemoteDataSource tenderContractRemoteDataSource;

  final mockSalesOrganisation = SalesOrganisation.empty();

  final mockShipToInfo = ShipToInfo.empty().copyWith(
      building: 'fakeBuilding',
      shipToCustomerCode: 'fake-ship-to-customer-code');
  final mockCustomerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');
  final mockMaterialInfo = MaterialInfo.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    tenderContractLocalDataSource = TenderContractLocalDataSourceMock();
    tenderContractRemoteDataSource = TenderContractRemoteDataSourceMock();

    tenderContractRepository = TenderContractRepository(
      config: mockConfig,
      tenderContractLocalDataSource: tenderContractLocalDataSource,
      tenderContractRemoteDataSource: tenderContractRemoteDataSource,
    );
  });

  group('tenderContractRepository should - ', () {
    test('get tenderContract successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => tenderContractLocalDataSource.getTenderContractDetails())
          .thenAnswer((invocation) async => <TenderContract>[]);

      final result = await tenderContractRepository.getTenderContractDetails(
          material: mockMaterialInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrganisation: mockSalesOrganisation,
          shipToInfo: mockShipToInfo);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get tenderContract fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => tenderContractLocalDataSource.getTenderContractDetails())
          .thenThrow((invocation) async => MockException());

      final result = await tenderContractRepository.getTenderContractDetails(
          material: mockMaterialInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrganisation: mockSalesOrganisation,
          shipToInfo: mockShipToInfo);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get tenderContract successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => tenderContractRemoteDataSource.getTenderContractDetails(
          materialNumber: '',
          salesOrg: '3050',
          selectedCustomerCode: '',
          shipTo: '')).thenAnswer((invocation) async => <TenderContract>[]);

      final result = await tenderContractRepository.getTenderContractDetails(
          material: mockMaterialInfo.copyWith(materialNumber: MaterialNumber('') ),
          customerCodeInfo: mockCustomerCodeInfo.copyWith(customerCodeSoldTo: ''),
          salesOrganisation: mockSalesOrganisation.copyWith(salesOrg: SalesOrg('3050') ),
          shipToInfo: mockShipToInfo.copyWith(shipToCustomerCode: ''));
      expect(
        result.isRight(),
        true,
      );
    });
    test('get tenderContract fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => tenderContractRemoteDataSource.getTenderContractDetails(
          materialNumber: '',
          salesOrg: '',
          selectedCustomerCode: '',
          shipTo: '')).thenThrow((invocation) async => MockException());

      final result = await tenderContractRepository.getTenderContractDetails(
          material: mockMaterialInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrganisation: mockSalesOrganisation,
          shipToInfo: mockShipToInfo);
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
