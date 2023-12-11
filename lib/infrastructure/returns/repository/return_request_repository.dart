import 'dart:io';
import 'dart:math';

import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_materials_params.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_materials_params_dto.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/add_request_params_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

const int _fileSizeLimitMB = 20;
const int _maxUpload = 10;

class ReturnRequestRepository extends IReturnRequestRepository {
  final Config config;
  final ReturnRequestLocalDataSource localDataSource;
  final ReturnRequestRemoteDataSource remoteDataSource;
  final DeviceInfo deviceInfo;
  final PermissionService permissionService;
  final FilePickerService filePickerService;
  final FileSystemHelper fileSystemHelper;

  ReturnRequestRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.deviceInfo,
    required this.permissionService,
    required this.filePickerService,
    required this.fileSystemHelper,
  });

  @override
  Future<Either<ApiFailure, ReturnMaterialList>> searchReturnMaterials({
    required ReturnMaterialsParams requestParams,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.searchReturnMaterials();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final returnRequest = await remoteDataSource.searchReturnMaterials(
        requestParams:
            ReturnMaterialsParamsDto.fromDomain(requestParams).toMap(),
      );

      return Right(returnRequest);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required UploadOptionType uploadOptionType,
  }) async {
    try {
      if (await deviceInfo.checkIfDeviceIsAndroidWithSDK33()) {
        return const Right(PermissionStatus.granted);
      }

      final isIos = defaultTargetPlatform == TargetPlatform.iOS;
      if (isIos && uploadOptionType == UploadOptionType.file) {
        return const Right(PermissionStatus.granted);
      }

      final permissionStatus = isIos
          ? await permissionService.requestPhotoPermission()
          : await permissionService.requestStoragePermission();

      return permissionStatus == PermissionStatus.granted ||
              permissionStatus == PermissionStatus.limited
          ? Right(permissionStatus)
          : Left(
              isIos
                  ? const ApiFailure.photoPermissionFailed()
                  : const ApiFailure.storagePermissionFailed(),
            );
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PlatformFile>>> pickFiles({
    required UploadOptionType uploadOptionType,
  }) async {
    try {
      final result = await filePickerService.pickFiles(
        allowMultiple: true,
        fileType: uploadOptionType == UploadOptionType.file
            ? FileType.custom
            : FileType.image,
        allowedExtensions: uploadOptionType == UploadOptionType.file
            ? locator<Config>().allowedExtensions
            : null,
      );
      final files = List<PlatformFile>.from(result?.files ?? [])
        ..removeWhere((element) => (element.path ?? '').isEmpty);

      final renamedFiles = files
          .map(
            (element) => PlatformFile(
              path: element.path,
              name: element.name,
              size: element.size,
              bytes: element.bytes,
              readStream: element.readStream,
              identifier: element.identifier,
            ),
          )
          .toList();

      return right(renamedFiles);
    } catch (e) {
      return const Left(
        ApiFailure.invalidFileFormat(),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<ReturnRequestAttachment>>> uploadFiles({
    required String assignmentNumber,
    required List<PlatformFile> files,
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.uploadFile();

        return Right([response]);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      if (files.length > _maxUpload) {
        return const Left(
          ApiFailure.uploadCountExcideLimit(),
        );
      }
      final biggerFile = files.where(
        (PlatformFile file) => file.size > (_fileSizeLimitMB * pow(1024, 2)),
      );
      if (biggerFile.isNotEmpty) {
        return Left(
          ApiFailure.other(
            'The file ${biggerFile.first.name} uploaded is greater than $_fileSizeLimitMB MB',
          ),
        );
      }
      final upLoadedFiles = Future.wait(
        files.map(
          (file) async => await remoteDataSource.uploadFile(
            folder: assignmentNumber,
            file: file,
            salesOrg: salesOrg.getOrCrash(),
          ),
        ),
      );

      return Right(await upLoadedFiles);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> deleteFile({
    required String filePath,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.deleteFile();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.deleteFile(
        filePath: filePath,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> getDownloadPermission() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return const Right(PermissionStatus.granted);
      }
      if (await deviceInfo.checkIfDeviceIsAndroidWithSDK33()) {
        return const Right(PermissionStatus.granted);
      }

      final permissionStatus =
          await permissionService.requestStoragePermission();

      return permissionStatus == PermissionStatus.granted ||
              permissionStatus == PermissionStatus.limited
          ? Right(permissionStatus)
          : const Left(ApiFailure.storagePermissionFailed());
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, File>> downloadFile({
    required ReturnRequestAttachment file,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = await localDataSource.downloadFile();
        final downloadedFile = await fileSystemHelper.getDownloadedFile(
          localFile,
          await deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
        );

        return Right(downloadedFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = await remoteDataSource.downloadFile(file);
      final downloadedFile = await fileSystemHelper.getDownloadedFile(
        localFile,
        await deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
      );

      return Right(downloadedFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, String>> addRequest({
    required AddRequestParams requestParams,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.addRequest();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final returnRequest = await remoteDataSource.addRequest(
        requestParams: AddRequestParamsDto.fromDomain(requestParams).toJson(),
      );

      return Right(returnRequest);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
