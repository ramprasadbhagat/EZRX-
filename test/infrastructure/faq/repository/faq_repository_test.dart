import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_remote.dart';
import 'package:ezrxmobile/infrastructure/faq/repository/faq_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MockSalesOrg extends Mock implements SalesOrg {}

class FAQInfoLocalDataSourceMock extends Mock
    implements FAQInfoLocalDataSource {}

class FAQInfoRemoteDataSourceMock extends Mock
    implements FAQInfoRemoteDataSource {}

void main() {
  late Config mockConfig;
  late SalesOrg mockSalesOrg;

  late FAQInfoRemoteDataSource remoteDataSource;
  late FAQInfoLocalDataSource localDataSource;
  late FAQInfoRepository repository;
  final faqMockList = FAQInfo.empty();
  final user = User.empty().copyWith(
    username: Username('fake-name'),
    role: Role(
      description: 'fake-desc',
      id: 'id',
      name: 'fake-name',
      type: RoleType('fake-type'),
    ),
    preferredLanguage: const Locale(ApiLanguageCode.english),
  );

  const pageSize = 24;

  setUpAll(() {
    mockConfig = MockConfig();
    mockSalesOrg = MockSalesOrg();
    localDataSource = FAQInfoLocalDataSourceMock();
    remoteDataSource = FAQInfoRemoteDataSourceMock();

    repository = FAQInfoRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('FAQRepository should - ', () {
    test(' get faqInfo successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getFAQInfo(),
      ).thenAnswer((invocation) async => faqMockList);

      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        user: user,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get FaqInfo fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getFAQInfo(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        user: user,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get FaqInfo successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(() => mockConfig.faqTemplate)
          .thenReturn('4A583EF3-A105-4A00-BC98-EC96A9967966');
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn('/api/announcement');
      when(() => mockSalesOrg.faqVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));

      when(
        () => remoteDataSource.getFAQInfo(
          announcementUrlPath: '/api/announcement',
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
          pageSize: 24,
          after: '',
          lang: user.preferredLanguage.toString(),
        ),
      ).thenAnswer((invocation) async => faqMockList);
      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        user: user,
        pageSize: pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get FaqInfo fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getFAQInfo(
          announcementUrlPath: '/api/announcement',
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
          pageSize: 24,
          after: '',
          lang: 'EN',
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        user: user,
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
