import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_local.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_remote.dart';
import 'package:ezrxmobile/infrastructure/about_us/repository/about_us_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class AboutUsLocalDataSourceMock extends Mock
    implements AboutUsLocalDataSource {}

class AboutUsRemoteDataSourceMock extends Mock
    implements AboutUsRemoteDataSource {}

void main() {
  late AboutUsRepository aboutUsRepository;
  late Config mockConfig;
  late AboutUsLocalDataSource aboutUsLocalDataSource;
  late AboutUsRemoteDataSource aboutUsRemoteDataSource;

  setUpAll(
    () {
      mockConfig = Config()..appFlavor = Flavor.mock;
      aboutUsLocalDataSource = AboutUsLocalDataSourceMock();
      aboutUsRemoteDataSource = AboutUsRemoteDataSourceMock();
      aboutUsRepository = AboutUsRepository(
        config: mockConfig,
        localDataSource: aboutUsLocalDataSource,
        remoteDataSource: aboutUsRemoteDataSource,
      );
    },
  );

  group('AboutUsRepository tests', () {
    test('get AboutUs Info successfully local', () async {
      when(() => aboutUsLocalDataSource.getAboutUs())
          .thenAnswer((invocation) async => AboutUs.empty());

      final result = await aboutUsRepository.getAboutUsInfo(
        salesOrg: fakeSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get AboutUs Info fail local', () async {
      when(() => aboutUsLocalDataSource.getAboutUs())
          .thenThrow(MockException());

      final result = await aboutUsRepository.getAboutUsInfo(
        salesOrg: fakeSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
      'get AboutUs Info successfully remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => aboutUsRemoteDataSource.getAboutUsInfo(
            aboutUsUrlPath: mockConfig.announcementApiUrlPath,
            itemId: fakeSalesOrg.aboutUsVariablePath,
            lang: fakeSalesOrg.locale.languageCode,
          ),
        ).thenAnswer((_) async => AboutUs.empty());
        final result = await aboutUsRepository.getAboutUsInfo(
          salesOrg: fakeSalesOrg,
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'get AboutUs Info fail remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => aboutUsRemoteDataSource.getAboutUsInfo(
            aboutUsUrlPath: mockConfig.announcementApiUrlPath,
            itemId: fakeSalesOrg.aboutUsVariablePath,
            lang: fakeSalesOrg.locale.languageCode,
          ),
        ).thenThrow(MockException());
        final result = await aboutUsRepository.getAboutUsInfo(
          salesOrg: fakeSalesOrg,
        );
        expect(
          result.isLeft(),
          true,
        );
      },
    );
  });
}
