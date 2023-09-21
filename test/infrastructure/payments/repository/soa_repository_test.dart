import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/soa_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/soa_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MockCustomerCodeInfo extends Mock implements CustomerCodeInfo {}

class SoaLocalDataSourceMock extends Mock implements SoaLocalDataSource {}

class SoaRemoteDataSourceMock extends Mock implements SoaRemoteDataSource {}

void main() {
  late Config mockConfig;
  late CustomerCodeInfo mockCustomerCodeInfo;

  late SoaRemoteDataSource remoteDataSource;
  late SoaLocalDataSource localDataSource;
  late SoaRepository repository;
  late List<Soa> soaMockList;
  late List<Soa> fakeSoaMockList;
  late dynamic res;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockConfig = MockConfig();
    mockCustomerCodeInfo = MockCustomerCodeInfo();
    localDataSource = SoaLocalDataSourceMock();
    remoteDataSource = SoaRemoteDataSourceMock();

    repository = SoaRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
    soaMockList = [Soa.empty()];
    res = json.decode(
      await rootBundle.loadString('assets/json/listSoaResponse.json'),
    );
    fakeSoaMockList = List.from(res['data'])
        .map((e) => SoaDto.fromJson(e).toDomain())
        .toList();
  });
  group('SOARepository should - ', () {
    test(' get Soa successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => mockCustomerCodeInfo.customerCodeSoldTo)
          .thenReturn('0030082707');

      when(
        () => localDataSource.getSoa(),
      ).thenAnswer((invocation) async => soaMockList);

      final result = await repository.fetchSoa(
        customerCodeInfo: mockCustomerCodeInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get Soa fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => mockCustomerCodeInfo.customerCodeSoldTo)
          .thenReturn('0030082707');

      when(
        () => localDataSource.getSoa(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.fetchSoa(
        customerCodeInfo: mockCustomerCodeInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get Soa successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getSoa('0030082707'),
      ).thenAnswer(
        (invocation) async => fakeSoaMockList,
      );
      final result = await repository.fetchSoa(
        customerCodeInfo:
            CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0030082707'),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get Soa fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getSoa('0030082707'),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.fetchSoa(
        customerCodeInfo:
            CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0030082707'),
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
