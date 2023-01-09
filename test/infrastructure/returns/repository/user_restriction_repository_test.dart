import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/user_restriction_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRestrictionLocalDataSourceMock extends Mock
    implements UserRestrictionLocalDataSource {}

class UserRestrictionRemoteDataSourceMock extends Mock
    implements UserRestrictionRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late SalesOrg salesOrg;
  late Config configMock;
  late UserRestrictionListDto mockUserRestrictionListDto;
  late UserRestrictionRepository userRestrictionRepository;
  late UserRestrictionLocalDataSource userRestrictionLocalDataSource;
  late UserRestrictionRemoteDataSource userRestrictionRemoteDataSource;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final data = json.decode(
      await rootBundle.loadString('assets/json/userRestrictionResponse.json'),
    );
    final finalData = data['data']['approverRights'];

    configMock = ConfigMock();
    mockUserRestrictionListDto = UserRestrictionListDto.fromJson(finalData);
    userRestrictionLocalDataSource = UserRestrictionLocalDataSourceMock();
    userRestrictionRemoteDataSource = UserRestrictionRemoteDataSourceMock();
    salesOrg = SalesOrg('2601');

    userRestrictionRepository = UserRestrictionRepository(
      config: configMock,
      localDataSource: userRestrictionLocalDataSource,
      remoteDataSource: userRestrictionRemoteDataSource,
    );
  });

  group('User Restriction Repository Test', () {
    test('Fetch restriction list from local data source successfully',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => userRestrictionLocalDataSource.fetch()).thenAnswer(
        (invocation) async => mockUserRestrictionListDto,
      );

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isRight(), true);
    });

    test('Fetch restriction list from local data source failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => userRestrictionLocalDataSource.fetch())
          .thenThrow((invocation) async => MockException());

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isLeft(), true);
    });

    test('Fetch restriction list from remote data source successfully',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => userRestrictionRemoteDataSource.fetch(
            salesOrg: salesOrg.getOrCrash(),
          )).thenAnswer((invocation) async => mockUserRestrictionListDto);

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isRight(), true);
    });

    test('Fetch restriction list from remote data source failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => userRestrictionRemoteDataSource.fetch(
            salesOrg: salesOrg.getOrCrash(),
          )).thenThrow((invocation) async => MockException());

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isLeft(), true);
    });
  });
}
