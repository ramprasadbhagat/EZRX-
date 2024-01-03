import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_materials_params.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/add_request_params_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_materials_params_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ConfigMock extends Mock implements Config {}

class ReturnRequestLocalDataSourceMock extends Mock
    implements ReturnRequestLocalDataSource {}

class ReturnRequestRemoteDataSourceMock extends Mock
    implements ReturnRequestRemoteDataSource {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class PermissionServiceMock extends Mock implements PermissionService {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

final locator = GetIt.instance;

void main() {
  late ReturnRequestRepository repository;
  late Config configMock;
  late ReturnRequestLocalDataSource localDataSourceMock;
  late ReturnRequestRemoteDataSource remoteDataSourceMock;
  late DeviceInfo deviceInfoMock;
  late PermissionService permissionServiceMock;
  late FilePickerService filePickerServiceMock;
  late FileSystemHelper fileSystemHelperMock;
  const pageSizeMock = 10;
  const offsetMock = 0;
  final requestParamsMock = ReturnMaterialsParams(
    salesOrg: fakeSalesOrg,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
    soldToInfo: fakeCustomerCodeInfo.customerCodeSoldTo,
    pageSize: pageSizeMock,
    offset: offsetMock,
    filter: ReturnItemsFilter.empty(),
    searchKey: SearchKey(''),
    language: fakeUserWithLanguageCode.preferredLanguage.languageCode,
    user: fakeUserWithLanguageCode,
  );
  final errorMock = Exception('fake-error');
  const fakePath = 'fake-path';
  const fakeName = 'fake-name';
  final fakeFile = PlatformFile(
    path: fakePath,
    name: fakeName,
    size: 10,
  );
  final fakeBigFile = PlatformFile(
    path: fakePath,
    name: fakeName,
    size: (20 * pow(1024, 2) + 1).toInt(),
  );
  final fakeAttachmentFile = AttachmentFileBuffer.empty();
  final fakeReturnRequestAttachment = ReturnRequestAttachment.empty();
  final fakeRequestParams = AddRequestParams(
    orderSource: 'fake-order-source',
    specialInstruction: 'fake-special-instruction',
    returnReference: 'fake-return-reference',
    userName: Username('fake-username'),
    soldTo: 'fake-sold_to',
    invoiceDetails: <InvoiceDetails>[],
  );
  final fakeAllowedExtensions = [
    'jpg',
    'pdf',
    'doc',
  ];

  setUpAll(
    () {
      configMock = ConfigMock();
      localDataSourceMock = ReturnRequestLocalDataSourceMock();
      remoteDataSourceMock = ReturnRequestRemoteDataSourceMock();
      deviceInfoMock = DeviceInfoMock();
      permissionServiceMock = PermissionServiceMock();
      filePickerServiceMock = FilePickerServiceMock();
      fileSystemHelperMock = FileSystemHelperMock();
      locator.registerLazySingleton(() => configMock);
      repository = ReturnRequestRepository(
        config: configMock,
        localDataSource: localDataSourceMock,
        remoteDataSource: remoteDataSourceMock,
        deviceInfo: deviceInfoMock,
        permissionService: permissionServiceMock,
        filePickerService: filePickerServiceMock,
        fileSystemHelper: fileSystemHelperMock,
      );
    },
  );

  group(
    'Return Request Repository',
    () {
      test(
        'Search Return Materials Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.searchReturnMaterials()).thenAnswer(
            (_) async => ReturnMaterialList.empty(),
          );
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Search Return Materials Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.searchReturnMaterials()).thenThrow(
            errorMock,
          );
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Search Return Materials Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.searchReturnMaterials(
              requestParams:
                  ReturnMaterialsParamsDto.fromDomain(requestParamsMock)
                      .copyWith(username: '')
                      .toMap(),
            ),
          ).thenAnswer(
            (_) async => ReturnMaterialList.empty(),
          );
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Search Return Materials Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.searchReturnMaterials(
              requestParams:
                  ReturnMaterialsParamsDto.fromDomain(requestParamsMock)
                      .copyWith(username: '')
                      .toMap(),
            ),
          ).thenThrow(errorMock);
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Permission For Android With SDK33',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => true,
          );
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For iOS And Upload File',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For iOS And Upload File',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For iOS And Upload Gallery',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestPhotoPermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.granted,
          );

          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For Android Without SDK33',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.granted,
          );

          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission Failure',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.denied,
          );

          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Permission Error',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenThrow(errorMock);

          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Pick Files Failure',
        () async {
          when(
            () => filePickerServiceMock.pickFiles(),
          ).thenThrow(errorMock);

          final result = await repository.pickFiles(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Pick Files Type File Success',
        () async {
          when(
            () => configMock.allowedExtensions,
          ).thenAnswer(
            (_) => fakeAllowedExtensions,
          );
          when(
            () => filePickerServiceMock.pickFiles(
              fileType: FileType.custom,
              allowedExtensions: fakeAllowedExtensions,
            ),
          ).thenAnswer(
            (_) async => FilePickerResult(
              [fakeFile],
            ),
          );

          final result = await repository.pickFiles(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Pick Files Type Gallery Success',
        () async {
          when(
            () => filePickerServiceMock.pickFiles(),
          ).thenAnswer(
            (_) async => FilePickerResult(
              [fakeFile],
            ),
          );

          final result = await repository.pickFiles(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Upload Files Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.uploadFile()).thenAnswer(
            (_) async => ReturnRequestAttachment.empty(),
          );
          final result = await repository.uploadFiles(
            files: [],
            user: fakeClientUser,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Upload Files Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.uploadFile()).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.uploadFiles(
            files: [],
            user: fakeClientUser,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Upload Files Max Upload Error',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          final result = await repository.uploadFiles(
            files: List.generate(11, (index) => fakeFile),
            user: fakeClientUser,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Upload Files Too Big Error',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          final result = await repository.uploadFiles(
            files: [fakeBigFile],
            user: fakeClientUser,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Upload Files Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          final file = MultipartFile.fromBytes([1, 2, 3]);
           when(
            () => fileSystemHelperMock.toMultipartFile(
              name: any(named: 'name'),
              path: any(named: 'path'),
            ),
          ).thenReturn(file);
          when(
            () => remoteDataSourceMock.uploadFile(
              file: file,
              userName: fakeClient.username.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => ReturnRequestAttachment.empty(),
          );
          final result = await repository.uploadFiles(
            files: [fakeFile],
            user: fakeClientUser,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Upload Files Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          final file = MultipartFile.fromBytes([1, 2, 3]);
          when(
            () => fileSystemHelperMock.toMultipartFile(
              name: any(named: 'name'),
              path: any(named: 'path'),
            ),
          ).thenReturn(file);
          when(
            () => remoteDataSourceMock.uploadFile(
              file: file,
              userName: fakeClient.username.getOrCrash(),
            ),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.uploadFiles(
            files: [fakeFile],
            user: fakeClientUser,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Delete File Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.deleteFile(),
          ).thenAnswer((_) async => true);
          final result = await repository.deleteFile(
            filePath: fakePath,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Delete File Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.deleteFile(),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.deleteFile(
            filePath: fakePath,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Delete File Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.deleteFile(
              filePath: fakePath,
            ),
          ).thenAnswer(
            (_) async => true,
          );
          final result = await repository.deleteFile(
            filePath: fakePath,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Delete File Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.deleteFile(
              filePath: fakePath,
            ),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.deleteFile(
            filePath: fakePath,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Download File Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
              .thenAnswer((_) async => true);
          when(
            () => localDataSourceMock.downloadFile(),
          ).thenAnswer((_) async => fakeAttachmentFile);
          when(
            () => fileSystemHelperMock.getDownloadedFile(
              fakeAttachmentFile,
              true,
            ),
          ).thenAnswer((_) async => File(fakePath));
          final result = await repository.downloadFile(
            file: fakeReturnRequestAttachment,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Download File Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.downloadFile(),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.downloadFile(
            file: fakeReturnRequestAttachment,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Download File Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
              .thenAnswer((_) async => false);
          when(
            () => remoteDataSourceMock.downloadFile(
              fakeReturnRequestAttachment,
            ),
          ).thenAnswer(
            (_) async => fakeAttachmentFile,
          );
          when(
            () => fileSystemHelperMock.getDownloadedFile(
              fakeAttachmentFile,
              false,
            ),
          ).thenAnswer((_) async => File(fakePath));
          final result = await repository.downloadFile(
            file: fakeReturnRequestAttachment,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Download File Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.downloadFile(
              fakeReturnRequestAttachment,
            ),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.downloadFile(
            file: fakeReturnRequestAttachment,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Add Request Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.addRequest(),
          ).thenAnswer((_) async => 'fake-response');
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Add Request Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.addRequest(),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Add Request Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.addRequest(
              requestParams:
                  AddRequestParamsDto.fromDomain(fakeRequestParams).toJson(),
            ),
          ).thenAnswer(
            (_) async => 'fake-response',
          );
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Add Request Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.addRequest(
              requestParams:
                  AddRequestParamsDto.fromDomain(fakeRequestParams).toJson(),
            ),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Download Permission For IOs',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

          final result = await repository.getDownloadPermission();
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Download Permission For Android With SDK33',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => true,
          );
          final result = await repository.getDownloadPermission();
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Download Permission For Android Without SDK33 Success',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.granted,
          );
          final result = await repository.getDownloadPermission();
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Download Permission For Android Without SDK33 Failure',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.denied,
          );
          final result = await repository.getDownloadPermission();
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Download Permission Error',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.getDownloadPermission();
          expect(result.isLeft(), true);
        },
      );
    },
  );
}
