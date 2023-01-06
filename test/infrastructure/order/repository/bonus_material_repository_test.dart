import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/bonus_material_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class BonusMaterialLocalDataSourceMock extends Mock
    implements BonusMaterialLocalDataSource {}

class BonusMaterialRemoteDataSourceMock extends Mock
    implements BonusMaterialRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late BonusMaterialRepository bonusMaterialRepository;
  late Config mockConfig;
  late BonusMaterialLocalDataSource bonusMaterialLocalDataSource;
  late BonusMaterialRemoteDataSource bonusMaterialRemoteDataSource;

  final fakeSaleOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  final mockUser = User.empty();
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty()
      .copyWith(
          languageFilter: true,
          languageValue: LanguageValue('EN'),
          disablePrincipals: true,
          enableGimmickMaterial: true,
          principalList: ['123', '234', '345']);
  final mockShipToInfo = ShipToInfo.empty()
      .copyWith(shipToCustomerCode: '1234567', status: Status('fake_status'));
  final mockCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: '10007654',
    customerAttr7: CustomerAttr7('ZEV'),
    customerGrp4: CustomerGrp4('VR'),
    status: Status('fake_status'),
  );

  setUpAll(() {
    mockConfig = MockConfig();
    bonusMaterialLocalDataSource = BonusMaterialLocalDataSourceMock();
    bonusMaterialRemoteDataSource = BonusMaterialRemoteDataSourceMock();

    bonusMaterialRepository = BonusMaterialRepository(
        config: mockConfig,
        localDataSource: bonusMaterialLocalDataSource,
        remoteDataSource: bonusMaterialRemoteDataSource);
  });

  group('bonusMaterialRepository should - ', () {
    test('get bonusMaterial successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => bonusMaterialLocalDataSource.getadditionalBonus())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await bonusMaterialRepository.getMaterialBonus(
          user: mockUser,
          configs: mockSalesOrganisationConfigs,
          searchKey: '',
          customerInfo: mockCustomerCodeInfo,
          shipInfo: mockShipToInfo,
          salesOrganisation: fakeSaleOrg,
          pickAndPack: '');
      expect(
        result.isRight(),
        true,
      );
    });
    test('get bonusMaterial successfully locally for salesrep ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => bonusMaterialLocalDataSource.customerMaterialsForSalesRep())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await bonusMaterialRepository.getMaterialBonus(
          user: mockUser.copyWith(
              role:
                  Role.empty().copyWith(type: RoleType('external_sales_rep'))),
          configs: mockSalesOrganisationConfigs,
          searchKey: '',
          customerInfo: mockCustomerCodeInfo,
          shipInfo: mockShipToInfo,
          salesOrganisation: fakeSaleOrg,
          pickAndPack: '');
      expect(
        result.isRight(),
        true,
      );
    });
    test('get bonusMaterial fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => bonusMaterialLocalDataSource.getadditionalBonus())
          .thenThrow((invocation) async => MockException());

      final result = await bonusMaterialRepository.getMaterialBonus(
          user: mockUser,
          configs: mockSalesOrganisationConfigs,
          searchKey: '',
          customerInfo: mockCustomerCodeInfo,
          shipInfo: mockShipToInfo,
          salesOrganisation: fakeSaleOrg,
          pickAndPack: '');
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get bonusMaterial successfully remote  for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => bonusMaterialRemoteDataSource.customerMaterialsForSalesRep(
          username: 'user',
          soldTo: '10007654',
          shipTo: '1234567',
          salesOrganisation: '2601',
          gimmickMaterial: true,
          pickandpack: '',
          searchKey: 'uk')).thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await bonusMaterialRepository.getMaterialBonus(
          user: mockUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
              id: '1',
              username: Username('user'),
              email: EmailAddress('user@gmail.com'),
              customerCode: CustomerCode('10007654')),
          configs: mockSalesOrganisationConfigs,
          searchKey: 'uk',
          customerInfo: mockCustomerCodeInfo,
          shipInfo: mockShipToInfo,
          salesOrganisation: fakeSaleOrg,
          pickAndPack: '');
      expect(
        result.isRight(),
        true,
      );
    });
    test('get bonusMaterial successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => bonusMaterialRemoteDataSource.getadditionalBonus(
              searchKey: 'uk',
              salesOrganisation: '2601',
              customerCodeSoldTo: '10007654',
              shipToCode: '1234567'))
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await bonusMaterialRepository.getMaterialBonus(
          user: mockUser.copyWith(
              id: '1',
              username: Username('user'),
              email: EmailAddress('user@gmail.com'),
              customerCode: CustomerCode('10007654')),
          configs: mockSalesOrganisationConfigs,
          searchKey: 'uk',
          customerInfo: mockCustomerCodeInfo,
          shipInfo: mockShipToInfo,
          salesOrganisation: fakeSaleOrg,
          pickAndPack: '');
      expect(
        result.isRight(),
        true,
      );
    });
    test('get bonusMaterial fail remote  for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => bonusMaterialRemoteDataSource.customerMaterialsForSalesRep(
          username: 'user',
          soldTo: '10007654',
          shipTo: '1234567',
          salesOrganisation: '2601',
          gimmickMaterial: true,
          pickandpack: '',
          searchKey: 'uk')).thenThrow((invocation) async => MockException());

      final result = await bonusMaterialRepository.getMaterialBonus(
          user: mockUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
              id: '1',
              username: Username('user'),
              email: EmailAddress('user@gmail.com'),
              customerCode: CustomerCode('10007654')),
          configs: mockSalesOrganisationConfigs,
          searchKey: 'uk',
          customerInfo: mockCustomerCodeInfo,
          shipInfo: mockShipToInfo,
          salesOrganisation: fakeSaleOrg,
          pickAndPack: '');
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get bonusMaterial fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => bonusMaterialRemoteDataSource.getadditionalBonus(
              searchKey: 'uk',
              salesOrganisation: '2601',
              customerCodeSoldTo: '10007654',
              shipToCode: '1234567'))
          .thenThrow((invocation) async => MockException());

      final result = await bonusMaterialRepository.getMaterialBonus(
          user: mockUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
              id: '1',
              username: Username('user'),
              email: EmailAddress('user@gmail.com'),
              customerCode: CustomerCode('10007654')),
          configs: mockSalesOrganisationConfigs,
          searchKey: 'uk',
          customerInfo: mockCustomerCodeInfo,
          shipInfo: mockShipToInfo,
          salesOrganisation: fakeSaleOrg,
          pickAndPack: '');
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
