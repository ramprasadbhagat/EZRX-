import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_remote.dart';
import 'package:ezrxmobile/infrastructure/article_info/repository/article_info_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MockSalesOrg extends Mock implements SalesOrg {}

class ArticleInfoLocalDataSourceMock extends Mock
    implements ArticleInfoLocalDataSource {}

class ArticleInfoRemoteDataSourceMock extends Mock
    implements ArticleInfoRemoteDataSource {}

void main() {
  late Config mockConfig;
  late SalesOrg mockSalesOrg;

  late ArticleInfoRemoteDataSource remoteDataSource;
  late ArticleInfoLocalDataSource localDataSource;
  late ArticleInfoRepository repository;

  const pageSize = 24;

  setUpAll(() {
    mockConfig = MockConfig();
    mockSalesOrg = MockSalesOrg();
    localDataSource = ArticleInfoLocalDataSourceMock();
    remoteDataSource = ArticleInfoRemoteDataSourceMock();

    repository = ArticleInfoRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('Article Info Repository should - ', () {
    test(' get article Info successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getArticles(),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());

      final result = await repository.getArticles(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get article Info fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getArticles(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getArticles(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get article Info successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(() => mockConfig.articleTemplate)
          .thenReturn('4A583EF3-A105-4A00-BC98-EC96A9967966');
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn('/api/announcement');
      when(() => mockSalesOrg.articleVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));
      when(() => mockSalesOrg.locale).thenReturn(const Locale('fake-code'));
      when(() => mockSalesOrg.isID).thenReturn((false));

      when(
        () => remoteDataSource.getArticleInfo(
          announcementUrlPath: '/api/announcement',
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
          pageSize: 24,
          after: '',
          lang: 'fake-code',
        ),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());
      final result = await repository.getArticles(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get article Info fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getArticleInfo(
          announcementUrlPath: '/api/announcement',
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
          pageSize: 24,
          after: '',
          lang: 'fake-code',
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getArticles(
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
}
