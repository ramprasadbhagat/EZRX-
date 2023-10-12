import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/manage_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/payment_advice_footer_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/payment_advice_footer_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class ConfigMock extends Mock implements Config {}

class PaymentAdviceFooterLocalDataSourceMock extends Mock
    implements PaymentAdviceFooterLocalDataSource {}

class PaymentAdviceFooterRemoteDataSourceMock extends Mock
    implements PaymentAdviceFooterRemoteDataSource {}

class PermissionServiceMock extends Mock implements PermissionService {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

void main() {
  late PaymentAdviceFooterRepository paymentAdviceFooterRepository;
  late Config configMock;
  late PaymentAdviceFooterLocalDataSource
      paymentAdviceFooterLocalDataSourceMock;
  late PaymentAdviceFooterRemoteDataSource
      paymentAdviceFooterRemoteDataSourceMock;
  late PermissionService permissionServiceMock;
  late FilePickerService filePickerServiceMock;
  late DeviceInfo deviceInfoMock;
  late List<PaymentAdviceFooter> paymentAdvicesMock;
  late ManagePaymentAdviceFooterResponse managePaymentAdviceFooterResponseMock;
  late List<String> allowedExtensionsPaymentAdviceLogoMock;
  late PaymentAdviceLogoNetworkFile paymentAdviceLogoNetworkFileMock;
  final fakeFilePickerResult =
      FilePickerResult([PlatformFile(name: 'fake-name', size: 0)]);
  final fakeException = Exception('fake-exception');
  final fakeMockException = MockException(message: 'fake-exception');
  final fakePlatformFile = PlatformFile(
    name: 'fake-name',
    size: 0,
    path: 'assets/json/deletePaymentAdviceMutationResponse.json',
  );
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    paymentAdviceFooterLocalDataSourceMock =
        PaymentAdviceFooterLocalDataSourceMock();
    paymentAdviceFooterRemoteDataSourceMock =
        PaymentAdviceFooterRemoteDataSourceMock();
    deviceInfoMock = DeviceInfoMock();
    filePickerServiceMock = FilePickerServiceMock();
    permissionServiceMock = PermissionServiceMock();
    locator.registerSingleton<Config>(configMock);

    paymentAdviceFooterRepository = PaymentAdviceFooterRepository(
      config: configMock,
      deviceInfo: deviceInfoMock,
      filePickerService: filePickerServiceMock,
      permissionService: permissionServiceMock,
      localDataSource: paymentAdviceFooterLocalDataSourceMock,
      remoteDataSource: paymentAdviceFooterRemoteDataSourceMock,
    );
    paymentAdvicesMock =
        await PaymentAdviceFooterLocalDataSource().getPaymentAdvice();
    managePaymentAdviceFooterResponseMock =
        await PaymentAdviceFooterLocalDataSource().addPaymentAdvice();
    allowedExtensionsPaymentAdviceLogoMock =
        Config().allowedExtensionsPaymentAdviceLogo;
    paymentAdviceLogoNetworkFileMock =
        await PaymentAdviceFooterLocalDataSource().headerLogoUpload();

    registerFallbackValue(
      MultipartFile.fromFileSync(
        fakePlatformFile.path ?? '',
        filename: fakePlatformFile.name,
      ),
    );
  });
  group('test the getPaymentAdvice ', () {
    test('getPaymentAdvice in mock Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.getPaymentAdvice())
          .thenAnswer((invocation) async => paymentAdvicesMock);
      final result = await paymentAdviceFooterRepository.getPaymentAdvice();
      expect(result.isRight(), true);
    });
    test('getPaymentAdvice in mock Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.getPaymentAdvice())
          .thenThrow((invocation) async => Exception('fake-error'));
      final result = await paymentAdviceFooterRepository.getPaymentAdvice();
      expect(result.isLeft(), true);
    });

    test('getPaymentAdvice in uat Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(() => paymentAdviceFooterRemoteDataSourceMock.getPaymentAdvice())
          .thenAnswer((invocation) async => paymentAdvicesMock);
      final result = await paymentAdviceFooterRepository.getPaymentAdvice();
      expect(result.isRight(), true);
    });
    test('getPaymentAdvice in uat Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(() => paymentAdviceFooterRemoteDataSourceMock.getPaymentAdvice())
          .thenThrow((invocation) async => Exception('fake-error'));
      final result = await paymentAdviceFooterRepository.getPaymentAdvice();
      expect(result.isLeft(), true);
    });
  });

  group('test the addPaymentAdvice', () {
    test('addPaymentAdvice in mock Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.addPaymentAdvice())
          .thenAnswer(
        (invocation) async => managePaymentAdviceFooterResponseMock,
      );
      final result = await paymentAdviceFooterRepository.addPaymentAdvice(
        paymentAdviceFooterData: paymentAdvicesMock.first,
      );
      expect(result.isRight(), true);
    });
    test('addPaymentAdvice in mock Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.addPaymentAdvice())
          .thenThrow(fakeMockException);
      final result = await paymentAdviceFooterRepository.addPaymentAdvice(
        paymentAdviceFooterData: paymentAdvicesMock.first,
      );
      expect(result.isLeft(), true);
    });

    test('addPaymentAdvice in uat Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(
        () => paymentAdviceFooterRemoteDataSourceMock.addPaymentAdvice(
          query: PaymentAdviceFooterDto.fromDomain(
            paymentAdvicesMock.first,
          ).toJson(),
        ),
      ).thenAnswer(
        (invocation) async => managePaymentAdviceFooterResponseMock,
      );
      final result = await paymentAdviceFooterRepository.addPaymentAdvice(
        paymentAdviceFooterData: paymentAdvicesMock.first,
      );
      expect(result.isRight(), true);
    });
    test('addPaymentAdvice in uat Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(
        () => paymentAdviceFooterRemoteDataSourceMock.addPaymentAdvice(
          query: PaymentAdviceFooterDto.fromDomain(
            paymentAdvicesMock.first,
          ).toJson(),
        ),
      ).thenThrow(
        (invocation) async => fakeException,
      );
      final result = await paymentAdviceFooterRepository.addPaymentAdvice(
        paymentAdviceFooterData: paymentAdvicesMock.first,
      );
      expect(result.isLeft(), true);
    });
  });
  group('test the pickFile', () {
    test('pickFile failed', () async {
      when(() => configMock.allowedExtensionsPaymentAdviceLogo).thenAnswer(
        (invocation) => allowedExtensionsPaymentAdviceLogoMock,
      );
      when(
        () => filePickerServiceMock.pickFiles(
          allowMultiple: false,
          fileType: FileType.custom,
          allowedExtensions: allowedExtensionsPaymentAdviceLogoMock,
        ),
      ).thenThrow(
        fakeException,
      );
      final result = await paymentAdviceFooterRepository.pickFiles(
        pickFrom: PickFrom.file,
      );
      expect(result.isLeft(), true);
    });

    test('pickFile success', () async {
      when(() => configMock.allowedExtensionsPaymentAdviceLogo).thenAnswer(
        (invocation) => allowedExtensionsPaymentAdviceLogoMock,
      );
      when(
        () => filePickerServiceMock.pickFiles(
          allowMultiple: false,
          fileType: FileType.custom,
          allowedExtensions: allowedExtensionsPaymentAdviceLogoMock,
        ),
      ).thenAnswer(
        (_) async => fakeFilePickerResult,
      );
      final result = await paymentAdviceFooterRepository.pickFiles(
        pickFrom: PickFrom.file,
      );
      expect(result.isRight(), true);
    });
  });
  group('test the getPermission', () {
    test('getPermission checkIfDeviceIsAndroidWithSDK33 = true', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (invocation) async => true,
      );

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.file,
      );
      expect(result.isRight(), true);
    });

    test('getPermission platform is IOS and pickFile.file', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (invocation) async => false,
      );
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.file,
      );
      expect(result.isRight(), true);
    });
    test('getPermission platform is IOS and not pickFile', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (invocation) async => false,
      );
      when(() => permissionServiceMock.requestPhotoPermission()).thenAnswer(
        (invocation) async => PermissionStatus.granted,
      );
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.gallery,
      );
      expect(result.isRight(), true);
    });

    test('getPermission limited platform is IOS and not pickFile', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (invocation) async => false,
      );
      when(() => permissionServiceMock.requestPhotoPermission()).thenAnswer(
        (invocation) async => PermissionStatus.limited,
      );
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.gallery,
      );
      expect(result.isRight(), true);
    });

    test('getPermission denied platform is IOS and not pickFile', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (invocation) async => false,
      );
      when(() => permissionServiceMock.requestPhotoPermission()).thenAnswer(
        (invocation) async => PermissionStatus.denied,
      );
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.gallery,
      );
      expect(result.isLeft(), true);
    });

    test('getPermission platform is Android and not pickFile', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (invocation) async => false,
      );
      when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
        (invocation) async => PermissionStatus.granted,
      );
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.gallery,
      );
      expect(result.isRight(), true);
    });

    test('getPermission denied platform is Android and not pickFile', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (invocation) async => false,
      );
      when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
        (invocation) async => PermissionStatus.denied,
      );
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.gallery,
      );
      expect(result.isLeft(), true);
    });

    test('getPermission failed', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenThrow(
        (invocation) async => fakeException,
      );

      final result = await paymentAdviceFooterRepository.getPermission(
        pickFrom: PickFrom.gallery,
      );
      expect(result.isLeft(), true);
    });
  });
  group('test the uploadHeaderLogo', () {
    test('uploadHeaderLogo in mock Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.headerLogoUpload())
          .thenThrow((invocation) async => fakeException);
      final result = await paymentAdviceFooterRepository.uploadHeaderLogo(
        file: fakePlatformFile,
      );
      expect(result.isLeft(), true);
    });
    test('uploadHeaderLogo in mock Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.headerLogoUpload())
          .thenAnswer((invocation) async => paymentAdviceLogoNetworkFileMock);
      final result = await paymentAdviceFooterRepository.uploadHeaderLogo(
        file: fakePlatformFile,
      );
      expect(result.isRight(), true);
    });

    test('uploadHeaderLogo in uat Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(
        () => paymentAdviceFooterRemoteDataSourceMock.headerLogoUpload(
          file: MultipartFile.fromString(
            fakePlatformFile.path ?? '',
            filename: fakePlatformFile.name,
          ),
        ),
      ).thenThrow((invocation) async => fakeException);
      final result = await paymentAdviceFooterRepository.uploadHeaderLogo(
        file: fakePlatformFile,
      );
      expect(result.isLeft(), true);
    });

    test('uploadHeaderLogo in uat Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(
        () => paymentAdviceFooterRemoteDataSourceMock.headerLogoUpload(
          file: any(named: 'file'),
        ),
      ).thenAnswer((invocation) async => PaymentAdviceLogoNetworkFile.empty());
      final result = await paymentAdviceFooterRepository.uploadHeaderLogo(
        file: fakePlatformFile,
      );
      expect(result.isRight(), true);
    });
  });

  group('test the deletePaymentAdvice', () {
    test('deletePaymentAdvice in mock Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.deletePaymentAdvice())
          .thenThrow(fakeMockException);
      final result = await paymentAdviceFooterRepository.deletePaymentAdvice(
        paymentAdviceFooter: paymentAdvicesMock.first,
      );
      expect(result.isLeft(), true);
    });
    test('deletePaymentAdvice in mock Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.mock);
      when(() => paymentAdviceFooterLocalDataSourceMock.deletePaymentAdvice())
          .thenAnswer(
        (_) async => managePaymentAdviceFooterResponseMock,
      );
      final result = await paymentAdviceFooterRepository.deletePaymentAdvice(
        paymentAdviceFooter: paymentAdvicesMock.first,
      );
      expect(result.isRight(), true);
    });
    test('deletePaymentAdvice in uat Flavor failed', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(
        () => paymentAdviceFooterRemoteDataSourceMock.deletePaymentAdvice(
          salesOrg: paymentAdvicesMock.first.salesOrg.getOrCrash(),
          salesDistrict: paymentAdvicesMock
              .first.salesDistrict.salesDistrictHeader
              .getOrDefaultValue(''),
        ),
      ).thenThrow((invocation) async => fakeException);
      final result = await paymentAdviceFooterRepository.deletePaymentAdvice(
        paymentAdviceFooter: paymentAdvicesMock.first,
      );
      expect(result.isLeft(), true);
    });

    test('deletePaymentAdvice in uat Flavor success', () async {
      when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
      when(
        () => paymentAdviceFooterRemoteDataSourceMock.deletePaymentAdvice(
          salesOrg: paymentAdvicesMock.first.salesOrg.getOrCrash(),
          salesDistrict: paymentAdvicesMock
              .first.salesDistrict.salesDistrictHeader
              .getOrDefaultValue(''),
        ),
      ).thenAnswer(
        (invocation) async => managePaymentAdviceFooterResponseMock,
      );
      final result = await paymentAdviceFooterRepository.deletePaymentAdvice(
        paymentAdviceFooter: paymentAdvicesMock.first,
      );
      expect(result.isRight(), true);
    });
  });
}
