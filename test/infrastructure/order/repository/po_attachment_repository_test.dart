import 'dart:io';
import 'dart:math';

import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';

const String kTemporaryPath = '/';
const String kApplicationSupportPath = '/';
const String kDownloadsPath = '/';
const String kLibraryPath = '/';
const String kApplicationDocumentsPath = '/';
const String kExternalCachePath = '/';
const String kExternalStoragePath = '/';

class FileMock extends Mock implements File {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

class MockConfig extends Mock implements Config {}

class PoDocumentLocalDataSourceMock extends Mock
    implements PoDocumentLocalDataSource {}

class PoDocumentRemoteDataSourceMock extends Mock
    implements PoDocumentRemoteDataSource {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

class PermissionServiceMock extends Mock implements PermissionService {}

void main() {
  late PoAttachmentRepository poAttachmentRepository;
  late Config mockConfig;
  late PoDocumentLocalDataSource poDocumentLocalDataSourceMock;
  late PoDocumentRemoteDataSource poDocumentRemoteDataSourceMock;
  late DeviceInfo deviceInfoMock;
  late FilePickerService filePickerServiceMock;
  late PermissionService permissionServiceMock;
  late FileSystemHelperMock fileSystemHelperMock;

  final user = User.empty().copyWith(
    username: Username('fake-username'),
  );
  setUp(() {
    mockConfig = MockConfig();
    poDocumentLocalDataSourceMock = PoDocumentLocalDataSourceMock();
    poDocumentRemoteDataSourceMock = PoDocumentRemoteDataSourceMock();
    deviceInfoMock = DeviceInfoMock();
    filePickerServiceMock = FilePickerServiceMock();
    permissionServiceMock = PermissionServiceMock();
    fileSystemHelperMock = FileSystemHelperMock();
    poAttachmentRepository = PoAttachmentRepository(
      config: mockConfig,
      localDataSource: poDocumentLocalDataSourceMock,
      remoteDataSource: poDocumentRemoteDataSourceMock,
      deviceInfo: deviceInfoMock,
      filePickerService: filePickerServiceMock,
      permissionService: permissionServiceMock,
      fileSystemHelper: fileSystemHelperMock,
    );
  });


  group('PoAttachmentRepository fileDownload test  ', () {
    test('download file successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => poDocumentLocalDataSourceMock.fileDownload(
          'fake-name',
        ),
      ).thenAnswer(
        (invocation) async =>
            PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
      );
      when(
        () => fileSystemHelperMock.getDownloadedFile(
          PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
        ),
      ).thenAnswer(
        (invocation) async => FileMock(),
      );

      final result = await poAttachmentRepository.downloadFiles(
        files: [
          PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url')
        ],
        attachmentType: AttachmentType.downloadAttachment,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('download file fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = await poAttachmentRepository.downloadFiles(
        files: [
          PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url')
        ],
        attachmentType: AttachmentType.downloadAttachment,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('download file successfully remote', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
            'fake-name', 'fake-url', AttachmentType.downloadPOAttachment),
      ).thenAnswer(
        (invocation) async =>
            PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
      );

      when(
        () => fileSystemHelperMock.getDownloadedFile(
          PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
        ),
      ).thenAnswer(
        (invocation) async => FileMock(),
      );

      final result = await poAttachmentRepository.downloadFiles(
        files: [
          PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url')
        ],
        attachmentType: AttachmentType.downloadPOAttachment,
      );
      expect(
        result.isRight(),
        true,
      );
      debugDefaultTargetPlatformOverride = null;
    });

    test('download file fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      final result = await poAttachmentRepository.downloadFiles(
        files: [
          PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url')
        ],
        attachmentType: AttachmentType.downloadAttachment,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

  });

  group('PoAttachmentRepository Open file test  ', () {
    test('file open successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => poDocumentLocalDataSourceMock.fileDownload(
          'fake-name',
        ),
      ).thenAnswer(
        (invocation) async =>
            PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
      );
      when(
        () => fileSystemHelperMock.openFile(
          PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
        ),
      ).thenAnswer(
        (invocation) async => OpenResult(),
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url'),
        attachmentType: AttachmentType.downloadAttachment,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('file open successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
          'fake-name',
          'fake-url',
          AttachmentType.downloadAttachment,
        ),
      ).thenAnswer(
        (invocation) async =>
            PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
      );
      when(
        () => fileSystemHelperMock.openFile(
          PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
        ),
      ).thenAnswer(
        (invocation) async => OpenResult(),
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url'),
        attachmentType: AttachmentType.downloadAttachment,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('file open download local fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => poDocumentLocalDataSourceMock.fileDownload(
            'fake-name',
          )).thenThrow(MockException());
      when(
        () => fileSystemHelperMock.openFile(
          PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
        ),
      ).thenAnswer(
        (invocation) async => OpenResult(),
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url'),
        attachmentType: AttachmentType.downloadPOAttachment,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('file open download remote fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => poDocumentRemoteDataSourceMock.fileDownload(
            'fake-name',
            'fake-url',
            AttachmentType.downloadPOAttachment,
          )).thenThrow(MockException());
      when(
        () => fileSystemHelperMock.openFile(
          PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
        ),
      ).thenAnswer(
        (invocation) async => OpenResult(),
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url'),
        attachmentType: AttachmentType.downloadPOAttachment,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('file open  fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
          'fake-name',
          'fake-url',
          AttachmentType.downloadPOAttachment,
        ),
      ).thenAnswer(
        (invocation) async =>
            PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
      );
      when(
        () => fileSystemHelperMock.openFile(
          PoDocumentsBuffer.empty().copyWith(name: 'fake-name'),
        ),
      ).thenAnswer(
        (invocation) async => OpenResult(type: ResultType.error),
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url'),
        attachmentType: AttachmentType.downloadPOAttachment,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
    group('PoAttachmentRepository getPermission test  ', () {
      test('android 33 permission', () async {
        when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((invocation) async => true);

        final result = await poAttachmentRepository.getPermission(
          uploadOptionType: UploadOptionType.file,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('ios file permission', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((invocation) async => false);

        final result = await poAttachmentRepository.getPermission(
          uploadOptionType: UploadOptionType.file,
        );
        expect(
          result.isRight(),
          true,
        );
        debugDefaultTargetPlatformOverride = null;
      });

      test('ios photo permission denied', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((invocation) async => false);
        when(() => permissionServiceMock.requestPhotoPermission()).thenAnswer(
          (invocation) async => PermissionStatus.denied,
        );
        final result = await poAttachmentRepository.getPermission(
          uploadOptionType: UploadOptionType.gallery,
        );
        expect(
          result.isLeft(),
          true,
        );
        debugDefaultTargetPlatformOverride = null;
      });

      test('ios photo permission granted', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((invocation) async => false);
        when(() => permissionServiceMock.requestPhotoPermission()).thenAnswer(
          (invocation) async => PermissionStatus.granted,
        );
        final result = await poAttachmentRepository.getPermission(
          uploadOptionType: UploadOptionType.gallery,
        );
        expect(
          result.isRight(),
          true,
        );
        debugDefaultTargetPlatformOverride = null;
      });

      test('android permission denied', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((invocation) async => false);
        when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
          (invocation) async => PermissionStatus.denied,
        );
        final result = await poAttachmentRepository.getPermission(
          uploadOptionType: UploadOptionType.gallery,
        );
        expect(
          result.isLeft(),
          true,
        );
        debugDefaultTargetPlatformOverride = null;
      });

      test('android permission granted', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((invocation) async => false);
        when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
          (invocation) async => PermissionStatus.granted,
        );
        final result = await poAttachmentRepository.getPermission(
          uploadOptionType: UploadOptionType.gallery,
        );
        expect(
          result.isRight(),
          true,
        );
        debugDefaultTargetPlatformOverride = null;
      });
    });

  

  group('PoAttachmentRepository pickFiles test  ', () {
    test('pickFiles Error', () async {
      when(() => filePickerServiceMock.pickFiles()).thenThrow(
        (invocation) => const ApiFailure.other('fake-Error'),
      );
      final result = await poAttachmentRepository.pickFiles(
          uploadOptionType: UploadOptionType.gallery,
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          user: user);
      expect(
        result.isLeft(),
        true,
      );
    });

    test('pickFiles no file selected', () async {
      when(() => filePickerServiceMock.pickFiles()).thenAnswer(
        (invocation) async => null,
      );
      final result = await poAttachmentRepository.pickFiles(
        uploadOptionType: UploadOptionType.gallery,
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: user,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('pickFiles no file selected', () async {
      when(() => filePickerServiceMock.pickFiles()).thenAnswer(
        (invocation) async =>
            FilePickerResult([PlatformFile(name: 'fake-name', size: 0)]),
      );
      final result = await poAttachmentRepository.pickFiles(
        uploadOptionType: UploadOptionType.gallery,
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: user,
      );
      expect(
        result.isRight(),
        true,
      );
    });
  });

  group('PoAttachmentRepository uploadFiles test  ', () {
    test('uploadFiles local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => poDocumentLocalDataSourceMock.fileUpload(),
      ).thenAnswer(
        (invocation) async => PoDocuments.empty(),
      );
      final result = await poAttachmentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        files: [
          PlatformFile(name: 'fake-name', size: 0),
        ],
        salesOrg: SalesOrg(''),
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('uploadFiles local fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => poDocumentLocalDataSourceMock.fileUpload(),
      ).thenThrow(
        (invocation) async => const ApiFailure.other('fake-error'),
      );
      final result = await poAttachmentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        files: [
          PlatformFile(name: 'fake-name', size: 0),
        ],
        salesOrg: SalesOrg(''),
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('uploadFiles remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => poDocumentLocalDataSourceMock.fileUpload(),
      ).thenAnswer(
        (invocation) async => PoDocuments.empty(),
      );
      final result = await poAttachmentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        files: [],
        salesOrg: SalesOrg(''),
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('uploadFiles remote fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final result = await poAttachmentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        files: [
          PlatformFile(name: 'fake-name', size: 0),
        ],
        salesOrg: SalesOrg(''),
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: List.filled(10, PoDocuments.empty()),
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('uploadFiles remote try upload bigger file', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final result = await poAttachmentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        files: [
          PlatformFile(name: 'fake-name', size: (10 * pow(1024, 2)).toInt()),
        ],
        salesOrg: SalesOrg(''),
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
