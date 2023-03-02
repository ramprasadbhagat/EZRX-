import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/combo_deal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ComboDealLocalDataSourceMock extends Mock
    implements ComboDealLocalDataSource {}

class ComboDealRemoteDataSourceMock extends Mock
    implements ComboDealRemoteDataSource {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late ComboDealRepository repository;
  late Config mockConfig;
  late ComboDealLocalDataSource localDataSource;
  late ComboDealRemoteDataSource remoteDataSource;

  final fakeSaleOrg = SalesOrg('2601');
  final fakeCustomerCode =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0030031512');
  final fakeComboDealQuery = PriceComboDeal.empty().copyWith(
    isEligible: true,
    flexibleGroup: FlexibleGroup('fake-group'),
    salesDeal: SalesDealNumber('fake-deal'),
  );

  final fakeQueryMaterialNumbers = [
    MaterialNumber('000000000023210571'),
    MaterialNumber('000000000023245612'),
  ];
  final fakeComboDeals = [ComboDeal.empty()];

  setUp(() {
    localDataSource = ComboDealLocalDataSourceMock();
    remoteDataSource = ComboDealRemoteDataSourceMock();
    mockConfig = MockConfig();
    repository = ComboDealRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  group('Combo Deal list', () {
    test('Get combo deal list successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getComboDealList())
          .thenAnswer((invocation) async => fakeComboDeals);

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => []),
        fakeComboDeals,
      );
    });

    test('Get combo deal list fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getComboDealList())
          .thenThrow((_) async => MockException());

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('Get combo deal list successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => remoteDataSource.getComboDealList(
          customerCode: '0030031512',
          flexibleGroup: 'fake-group',
          materialNumbers: [],
          salesDeal: 'fake-deal',
          salesOrgCode: '2601',
        ),
      ).thenAnswer((invocation) async => fakeComboDeals);

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => []),
        fakeComboDeals,
      );
    });

    test('Get combo deal list fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => remoteDataSource.getComboDealList(
          customerCode: '0030031512',
          flexibleGroup: 'fake-group',
          materialNumbers: [],
          salesDeal: 'fake-deal',
          salesOrgCode: '2601',
        ),
      ).thenThrow((_) async => MockException());

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
