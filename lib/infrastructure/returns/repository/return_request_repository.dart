import 'dart:math';

import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_remote.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

const int _fileSizeLimitMB = 5;
const int _maxUpload = 10;

class ReturnRequestRepository extends IReturnRequestRepository {
  final Config config;
  final ReturnRequestLocalDataSource localDataSource;
  final ReturnRequestRemoteDataSource remoteDataSource;
  final DeviceInfo deviceInfo;
  final PermissionService permissionService;
  final FilePickerService filePickerService;

  ReturnRequestRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.deviceInfo,
    required this.permissionService,
    required this.filePickerService,
  });

  @override
  Future<Either<ApiFailure, ReturnMaterialList>> searchReturnMaterials({
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
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
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        shipTo: shipToInfo.shipToCustomerCode,
        soldTo: customerCodeInfo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
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
            'The file ${biggerFile.first.name} uploaded is greater than 5 MB',
          ),
        );
      }
      final upLoadedFiles = Future.wait(
        files.map(
          (file) async => await remoteDataSource.uploadFile(
            folder: assignmentNumber,
            file: file,
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
}
