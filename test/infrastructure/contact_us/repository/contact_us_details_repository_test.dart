import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/contact_us/repository/contact_us_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class ContactUsDetailsLocalDataSourceMock extends Mock
    implements ContactUsDetailsLocalDataSource {}

class ContactUsDetailsRemoteDataSourceMock extends Mock
    implements ContactUsDetailsRemoteDataSource {}

void main() {
  late Config mockConfig;

  late ContactUsDetailsRemoteDataSource remoteDataSource;
  late ContactUsDetailsLocalDataSource localDataSource;
  late ContactUsDetailsRepository repository;

  final fakeUser = User.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    localDataSource = ContactUsDetailsLocalDataSourceMock();
    remoteDataSource = ContactUsDetailsRemoteDataSourceMock();
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    repository = ContactUsDetailsRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  group('Contact Us Details Repository - ', () {
    test('get Contact Us Details successfully locally ', () async {
      when(
        () => localDataSource.getContactUsDetails(),
      ).thenAnswer((invocation) async => ContactUsDetails.empty());

      final result = await repository.getContactUsDetails(
        salesOrg: fakeMYSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get Contact Us Details fail locally ', () async {
      when(
        () => localDataSource.getContactUsDetails(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getContactUsDetails(
        salesOrg: fakeMYSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get Contact Us Details successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.xGQLToken).thenReturn('fake-token');
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn('/api/announcement');
      when(
        () => remoteDataSource.getContactUsDetails(
          announcementUrlPath: '/api/announcement',
          lang: fakeUser.preferredLanguage.locale.languageCode,
          contactUsId: fakeMYSalesOrg.contactUsItemId,
          token: 'fake-token',
        ),
      ).thenAnswer((invocation) async => ContactUsDetails.empty());
      final result = await repository.getContactUsDetails(
        salesOrg: fakeMYSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get Contact Us Details fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.xGQLToken).thenReturn('fake-token');
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn('/api/announcement');
      when(
        () => remoteDataSource.getContactUsDetails(
          announcementUrlPath: '/api/announcement',
          lang: fakeUser.preferredLanguage.locale.languageCode,
          contactUsId: fakeMYSalesOrg.contactUsItemId,
          token: 'fake-token',
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getContactUsDetails(
        salesOrg: fakeMYSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
