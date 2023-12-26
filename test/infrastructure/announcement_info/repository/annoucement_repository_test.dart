import 'dart:ui';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_info_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class MockSalesOrg extends Mock implements SalesOrg {}

class MockAnnouncementArticleInfo extends Mock
    implements AnnouncementArticleInfo {}

class AnnouncementInfoLocalDataSourceMock extends Mock
    implements AnnouncementInfoLocalDataSource {}

class AnnouncementInfoRemoteDataSourceMock extends Mock
    implements AnnouncementInfoRemoteDataSource {}

void main() {
  late Config mockConfig;
  late SalesOrg mockSalesOrg;
  late AnnouncementArticleInfo mockAnnouncementArticleInfo;

  late AnnouncementInfoRemoteDataSource remoteDataSource;
  late AnnouncementInfoLocalDataSource localDataSource;
  late AnnouncementInfoRepository repository;

  final fakeUser = User.empty();

  const pageSize = 24;

  setUpAll(() {
    mockConfig = MockConfig();
    mockSalesOrg = MockSalesOrg();
    mockAnnouncementArticleInfo = MockAnnouncementArticleInfo();
    localDataSource = AnnouncementInfoLocalDataSourceMock();
    remoteDataSource = AnnouncementInfoRemoteDataSourceMock();

    repository = AnnouncementInfoRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('Announcement Info Repository should - ', () {
    test(' get announcement Info successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getAnnouncementInfo(),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());

      final result = await repository.getAnnouncement(
        user: fakeUser,
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get announcement Info fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getAnnouncementInfo(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getAnnouncement(
        user: fakeUser,
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get announcement Info successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(() => mockConfig.announcementTemplate)
          .thenReturn('4A583EF3-A105-4A00-BC98-EC96A9967966');
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn('/api/announcement');
      when(() => mockSalesOrg.announcementVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));

      when(
        () => remoteDataSource.getAnnouncementInfo(
          announcementUrlPath: '/api/announcement',
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
          pageSize: 24,
          after: '',
          lang: fakeUser.preferredLanguage.locale.languageCode,
        ),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());
      final result = await repository.getAnnouncement(
        user: fakeUser,
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get announcement Info fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getAnnouncementInfo(
          announcementUrlPath: '/api/announcement',
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
          pageSize: 24,
          after: '',
          lang: fakeUser.preferredLanguage.locale.languageCode,
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getAnnouncement(
        user: fakeUser,
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });

  group('Announcement Info Details Repository should - ', () {
    test(' get announcement Info details successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getAnnouncementInfoDetails(),
      ).thenAnswer((invocation) async => AnnouncementInfoDetails.empty());

      final result = await repository.getAnnouncementDetails(
        salesOrg: mockSalesOrg,
        announcementId: 'fake_id',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get announcement Info details fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getAnnouncementInfoDetails(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getAnnouncementDetails(
        salesOrg: mockSalesOrg,
        announcementId: 'fake_id',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get announcement Info details successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(() => mockConfig.announcementTemplate)
          .thenReturn('4A583EF3-A105-4A00-BC98-EC96A9967966');
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn('/api/announcement');
      when(() => mockSalesOrg.announcementVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));
      when(() => mockSalesOrg.announcementLocale)
          .thenReturn((const Locale('EN')));
      when(() => mockAnnouncementArticleInfo.announcementList).thenReturn(
        ([AnnouncementArticleItem.empty().copyWith(id: 'fake_id')]),
      );

      when(
        () => remoteDataSource.getAnnouncementInfoDetails(
          announcementUrlPath: '/api/announcement',
          lang: fakeMYSalesOrg.announcementLocale.languageCode,
          announcementId: 'fake_id',
        ),
      ).thenAnswer((invocation) async => AnnouncementInfoDetails.empty());
      final result = await repository.getAnnouncementDetails(
        salesOrg: fakeMYSalesOrg,
        announcementId: mockAnnouncementArticleInfo.announcementList.first.id,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get announcement Info details fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getAnnouncementInfoDetails(
          announcementUrlPath: '/api/announcement',
          lang: 'EN',
          announcementId: 'fake_id',
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getAnnouncementDetails(
        salesOrg: mockSalesOrg,
        announcementId: mockAnnouncementArticleInfo.announcementList.first.id,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
