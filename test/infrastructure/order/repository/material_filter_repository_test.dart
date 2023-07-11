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
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_filter_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MaterialFilterLocalDataSourceMock extends Mock
    implements MaterialFilterLocalDataSource {}

class MaterialFilterRemoteDataSourceMock extends Mock
    implements MaterialFilterRemoteDataSource {}

void main() {
  late MaterialFilterRepository materialFilterRepository;
  late Config mockConfig;
  late MaterialFilterLocalDataSource materialFilterLocalDataSource;
  late MaterialFilterRemoteDataSource materialFilterRemoteDataSource;

  final fakeSaleOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
      customerCodeSoldTo: '100000345',
      customerAttr7: CustomerAttr7('ZEV'),
      customerGrp4: CustomerGrp4('VR'),
      status: Status('fake_status'));
  final fakeShipToInfo = ShipToInfo.empty()
      .copyWith(shipToCustomerCode: '1234567', status: Status('fake_status'));
  final mockUser = User.empty();
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    materialFilterLocalDataSource = MaterialFilterLocalDataSourceMock();
    materialFilterRemoteDataSource = MaterialFilterRemoteDataSourceMock();

    materialFilterRepository = MaterialFilterRepository(
      config: mockConfig,
      filterMaterialLocalDataSource: materialFilterLocalDataSource,
      filterMaterialRemoteDataSource: materialFilterRemoteDataSource,
    );
  });

  group('materialFilterRepository should - ', () {
    test('get materialFilter successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialFilterLocalDataSource.getFilters())
          .thenAnswer((invocation) async => MaterialFilter.empty());

      final result = await materialFilterRepository.getMaterialFilterList(
          salesOrgConfig:
              mockSalesOrganisationConfigs.copyWith(salesOrg: SalesOrg('2601')),
          salesOrganisation: fakeSaleOrg,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: mockUser.copyWith(username: Username('fake_user')),
          pickAndPack: '',
          searchKey: '');
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialFilter fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialFilterLocalDataSource.getFilters())
          .thenThrow((invocation) async => MockException());

      final result = await materialFilterRepository.getMaterialFilterList(
          salesOrgConfig:
              mockSalesOrganisationConfigs.copyWith(salesOrg: SalesOrg('2601')),
          salesOrganisation: fakeSaleOrg,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: mockUser.copyWith(username: Username('fake_user')),
          pickAndPack: '',
          searchKey: '');
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialFilter successfully remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialFilterRemoteDataSource.getFiltersSalesRep(
              salesOrganisation: '2601',
              soldToCustomerCode: '100000345',
              shipToCustomerCode: '1234567',
              language: ApiLanguageCode.english,
              gimmickMaterial: false,
              userName: 'user'))
          .thenAnswer((invocation) async => MaterialFilter.empty());

      final result = await materialFilterRepository.getMaterialFilterList(
          salesOrgConfig: mockSalesOrganisationConfigs.copyWith(
              salesOrg: SalesOrg('2601'),
              languageFilter: true,
              languageValue: LanguageValue(ApiLanguageCode.english),
              currency: Currency('SG')),
          salesOrganisation: fakeSaleOrg,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: mockUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
              id: '1',
              username: Username('user'),
              email: EmailAddress('user@gmail.com'),
              customerCode: CustomerCode('100007654')),
          pickAndPack: '',
          searchKey: '');
      expect(
        result.isRight(),
        true,
      );
    });

    test('get materialFilter successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialFilterRemoteDataSource.getFilters(
            salesOrganisation: '2601',
            soldToCustomerCode: '100000345',
            shipToCustomerCode: '1234567',
            language: ApiLanguageCode.english,
            searchKey: '',
          )).thenAnswer((invocation) async => MaterialFilter.empty());

      final result = await materialFilterRepository.getMaterialFilterList(
          salesOrgConfig: mockSalesOrganisationConfigs.copyWith(
              salesOrg: SalesOrg('2601'),
              languageFilter: true,
              languageValue: LanguageValue(ApiLanguageCode.english),
              currency: Currency('SG')),
          salesOrganisation: fakeSaleOrg,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: mockUser.copyWith(
              id: '1',
              username: Username('user'),
              email: EmailAddress('user@gmail.com'),
              customerCode: CustomerCode('100007654')),
          pickAndPack: '',
          searchKey: '');
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialFilter fail remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialFilterRemoteDataSource.getFiltersSalesRep(
          salesOrganisation: '2601',
          soldToCustomerCode: '100000345',
          shipToCustomerCode: '1234567',
          language: ApiLanguageCode.english,
          gimmickMaterial: false,
          userName: 'user')).thenThrow((invocation) async => MockException());

      final result = await materialFilterRepository.getMaterialFilterList(
          salesOrgConfig:
              mockSalesOrganisationConfigs.copyWith(salesOrg: SalesOrg('2601')),
          salesOrganisation: fakeSaleOrg,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: mockUser.copyWith(username: Username('fake_user')),
          pickAndPack: '',
          searchKey: '');
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialFilter fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialFilterRemoteDataSource.getFilters(
            salesOrganisation: '2601',
            soldToCustomerCode: '100000345',
            shipToCustomerCode: '1234567',
            language: ApiLanguageCode.english,
            searchKey: '',
          )).thenThrow((invocation) async => MockException());

      final result = await materialFilterRepository.getMaterialFilterList(
          salesOrgConfig:
              mockSalesOrganisationConfigs.copyWith(salesOrg: SalesOrg('2601')),
          salesOrganisation: fakeSaleOrg,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: mockUser.copyWith(username: Username('fake_user')),
          pickAndPack: '',
          searchKey: '');
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
