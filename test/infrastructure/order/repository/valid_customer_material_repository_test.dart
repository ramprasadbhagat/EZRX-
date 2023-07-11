import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/valid_customer_material_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ValidCustomerMaterialLocalDataSourceMock extends Mock
    implements ValidCustomerMaterialLocalDataSource {}

class ValidCustomerMaterialRemoteDataSourceMock extends Mock
    implements ValidCustomerMaterialRemoteDataSource {}

void main() {
  late ValidCustomerMaterialRepository validCustomerMaterialRepository;
  late Config mockConfig;
  late ValidCustomerMaterialLocalDataSource
      validCustomerMaterialLocalDataSource;
  late ValidCustomerMaterialRemoteDataSource
      validCustomerMaterialRemoteDataSource;

  final fakeSaleOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));
  final fakeCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0030031512');
  final fakeShipToInfo =
      ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code');
  final fakeUser = User.empty().copyWith(username: Username('zpsgezrx'));

  final fakeQueryMaterialNumbers = [
    MaterialNumber('000000000023210571'),
    MaterialNumber('000000000023245612'),
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    validCustomerMaterialLocalDataSource =
        ValidCustomerMaterialLocalDataSourceMock();
    validCustomerMaterialRemoteDataSource =
        ValidCustomerMaterialRemoteDataSourceMock();

    validCustomerMaterialRepository = ValidCustomerMaterialRepository(
      config: mockConfig,
      localDataSource: validCustomerMaterialLocalDataSource,
      remoteDataSource: validCustomerMaterialRemoteDataSource,
    );
  });

  group('validCustomerMaterialRepository should - ', () {
    test('get validCustomerMaterial successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => validCustomerMaterialLocalDataSource.getValidMaterialList())
          .thenAnswer((invocation) async => <MaterialNumber>[]);

      final result = await validCustomerMaterialRepository.getValidMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          focMaterialList: fakeQueryMaterialNumbers,
          materialList: [],
          pickAndPack: '',
          salesOrganisation: fakeSaleOrg,
          shipToInfo: fakeShipToInfo,
          user: fakeUser);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get validCustomerMaterial fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => validCustomerMaterialLocalDataSource.getValidMaterialList())
          .thenThrow((invocation) async => MockException());
      final result = await validCustomerMaterialRepository.getValidMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          focMaterialList: fakeQueryMaterialNumbers,
          materialList: [],
          pickAndPack: 'include',
          salesOrganisation: fakeSaleOrg,
          shipToInfo: fakeShipToInfo,
          user: fakeUser);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get validCustomerMaterial successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => validCustomerMaterialRemoteDataSource.getValidMaterialList(
              salesOrganisation: '2601',
              customerCode: '0030031512',
              shipToCode: 'fake-ship-to-code',
              pickAndPackValue: '',
              materialList: [],
              focMaterialList: [
                '000000000023210571',
                '000000000023245612',
              ])).thenAnswer((invocation) async => <MaterialNumber>[]);

      final result = await validCustomerMaterialRepository.getValidMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          focMaterialList: fakeQueryMaterialNumbers,
          materialList: [],
          pickAndPack: '',
          salesOrganisation: fakeSaleOrg,
          shipToInfo: fakeShipToInfo,
          user: fakeUser);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get validCustomerMaterial fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => validCustomerMaterialRemoteDataSource.getValidMaterialList(
              salesOrganisation: '',
              customerCode: '',
              shipToCode: '',
              pickAndPackValue: '',
              materialList: [],
              focMaterialList: []))
          .thenThrow((invocation) async => MockException());
      final result = await validCustomerMaterialRepository.getValidMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          focMaterialList: fakeQueryMaterialNumbers,
          materialList: [],
          pickAndPack: '',
          salesOrganisation: fakeSaleOrg,
          shipToInfo: fakeShipToInfo,
          user: fakeUser.copyWith(username: Username('')));
      expect(
        result.isLeft(),
        false,
      );
    });
  });
}
