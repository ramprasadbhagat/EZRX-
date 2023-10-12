import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/contact_us_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/contact_us_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConfigMock extends Mock implements Config {}

class ContactUsRemoteDataSourceMock extends Mock
    implements ContactUsRemoteDataSource {}

class ContactUsLocalDataSourceMock extends Mock
    implements ContactUsLocalDataSource {}

void main() {
  late Config configMock;
  late ContactUsLocalDataSource localDataSourceMock;
  late ContactUsRemoteDataSource remoteDataSourceMock;
  late ContactUsRepository repository;
  late ContactUs contactUsMock;
  late String customerCodeMock;
  late String clinicNameMock;
  late String languageMock;
  

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    configMock = ConfigMock();
    localDataSourceMock = ContactUsLocalDataSourceMock();
    remoteDataSourceMock = ContactUsRemoteDataSourceMock();

    repository = ContactUsRepository(
      config: configMock,
      remoteDataSource: remoteDataSourceMock,
      localDataSource: localDataSourceMock,
    );

    contactUsMock = ContactUs.empty().copyWith(
      username: Username('mock-user-name'),
      contactNumber: PhoneNumber('mock-phone'),
      email: EmailAddress('mock-email@a.com'),
      message: StringValue('mock-message'),
    );
    customerCodeMock = 'mock-customer-code';
    clinicNameMock = 'mock-clinic-name';
    languageMock = 'en';
  });

  group('Contact us repository', () {
    test('submit local failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => localDataSourceMock.submit(),
      ).thenThrow((invocation) async => MockException());

      final result = await repository.submit(
        contactUs: contactUsMock,
        clinicName: clinicNameMock,
        customerCode: customerCodeMock,
        language: languageMock,
      );
      expect(result.isLeft(), true);
    });

    test('submit local success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => localDataSourceMock.submit(),
      ).thenAnswer((invocation) async => true);

      final result = await repository.submit(
        contactUs: contactUsMock,
        clinicName: clinicNameMock,
        customerCode: customerCodeMock,
        language: languageMock,
      );
      expect(result.isRight(), true);
    });

    test('submit remote failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSourceMock.submit(
          contactUsMap: ContactUsDto.fromDomain(contactUsMock).toJson(),
          clinicName: clinicNameMock,
          customerCode: customerCodeMock,
          language: languageMock,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await repository.submit(
        contactUs: contactUsMock,
        clinicName: clinicNameMock,
        customerCode: customerCodeMock,
        language: languageMock,
      );
      expect(result.isLeft(), true);
    });

    test('submit remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSourceMock.submit(
          contactUsMap: ContactUsDto.fromDomain(contactUsMock).toJson(),
          clinicName: clinicNameMock,
          customerCode: customerCodeMock,
          language: languageMock,
        ),
      ).thenAnswer((invocation) async => true);

      final result = await repository.submit(
        contactUs: contactUsMock,
        clinicName: clinicNameMock,
        customerCode: customerCodeMock,
        language: languageMock,
      );
      expect(result.isRight(), true);
    });
  });
}
