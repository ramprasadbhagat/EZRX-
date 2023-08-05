import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/aup_tc/entities/tncdate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_local.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_remote.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/repository/aup_tc_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAcceptanceDateLocalDataSource extends Mock
    implements AcceptanceDateLocalDataSource {}

class MockRemoteConfigService extends Mock implements RemoteConfigService {}

class MockAcceptanceDateRemoteDataSource extends Mock
    implements AcceptanceDateRemoteDataSource {}

class MockConfig extends Mock implements Config {}

void main() {
  group('AupTcRepository should - ', () {
    late AupTcRepository aupRepo;
    late AcceptanceDateLocalDataSource aupLocal;
    late AcceptanceDateRemoteDataSource aupRemote;
    late Config config;
    late RemoteConfigService remoteConfigService;

    setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
      aupLocal = MockAcceptanceDateLocalDataSource();
      aupRemote = MockAcceptanceDateRemoteDataSource();
      config = MockConfig();
      remoteConfigService = MockRemoteConfigService();
      aupRepo = AupTcRepository(
        config: config,
        localDataSource: aupLocal,
        remoteConfigService: remoteConfigService,
        remoteDataSource: aupRemote,
      );
    });
    test('get tncDate local successfully', () async {
      when(() => config.appFlavor).thenAnswer((_) => Flavor.mock);
      when(() => aupLocal.getAcceptanceDate()).thenAnswer(
        (invocation) async => TncDate(date: DateTime(2021, 07, 14)),
      );

      final apiFailureOrSuccess = await aupRepo.getTncDate();

      expect(apiFailureOrSuccess.isRight(), true);
    });

    test('get tncDate local failure', () async {
      when(() => config.appFlavor).thenAnswer((_) => Flavor.mock);
      when(() => aupLocal.getAcceptanceDate()).thenThrow(MockException());

      final apiFailureOrSuccess = await aupRepo.getTncDate();

      expect(apiFailureOrSuccess.isLeft(), true);
    });

    test('get tncDate remote successfully', () async {
      when(() => config.appFlavor).thenAnswer((_) => Flavor.uat);
      when(() => aupRemote.getAcceptanceDate()).thenAnswer(
        (invocation) async => TncDate(date: DateTime(2021, 07, 14)),
      );

      final apiFailureOrSuccess = await aupRepo.getTncDate();

      expect(apiFailureOrSuccess.isRight(), true);
    });

    test('get tncDate local failure', () async {
      when(() => config.appFlavor).thenAnswer((_) => Flavor.uat);
      when(() => aupRemote.getAcceptanceDate()).thenThrow(Error());

      final apiFailureOrSuccess = await aupRepo.getTncDate();

      expect(apiFailureOrSuccess.isLeft(), true);
    });

    test('get tncConfig local successfully', () {
      when(() => config.appFlavor).thenAnswer((_) => Flavor.mock);

      final tncEnabled = aupRepo.getTncConfig();

      expect(tncEnabled, true);
    });

    test('get tncConfig remote successfully', () {
      when(() => config.appFlavor).thenAnswer((_) => Flavor.uat);
      when(() => remoteConfigService.getTncConfig())
          .thenAnswer((invocation) => true);

      final tncEnabled = aupRepo.getTncConfig();

      expect(tncEnabled, true);
    });

    test('get tncConfig local failure', () {
      when(() => config.appFlavor).thenAnswer((_) => Flavor.uat);
      when(() => remoteConfigService.getTncConfig()).thenThrow(Error());

      final tncEnabled = aupRepo.getTncConfig();

      expect(tncEnabled, false);
    });
  });
}
