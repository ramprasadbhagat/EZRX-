import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_list_request.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_list_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_list_request_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class ReturnListRepository extends IReturnListRepository {
  final Config config;
  final ReturnListLocalDataSource localDataSource;
  final ReturnListRemoteDataSource remoteDataSource;
  final DeviceInfo deviceInfo;
  final PermissionService permissionService;
  final FileSystemHelper fileSystemHelper;

  ReturnListRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.permissionService,
    required this.deviceInfo,
    required this.fileSystemHelper,
  });

  @override
  Future<Either<ApiFailure, List<ReturnItem>>> fetchReturnListByItem({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToInfo,
    required User user,
    required int pageSize,
    required int offset,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnList = await localDataSource.fetchReturnByItems();

        return Right(returnList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnListByItemRequest = _getReturnListRequest(
        customerCode: customerCode.customerCodeSoldTo,
        salesOrg: salesOrg,
        shipToInfo: shipToInfo.shipToCustomerCode,
        user: user,
        pageSize: pageSize,
        offset: offset,
        appliedFilter: appliedFilter,
        searchKey: searchKey,
      );
      final returnList = await remoteDataSource.fetchReturnByItems(
        requestParams:
            ReturnListRequestDto.fromDomain(returnListByItemRequest).toMap(),
      );

      return Right(returnList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<ReturnItem>>> fetchReturnListByRequest({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToInfo,
    required User user,
    required int pageSize,
    required int offset,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnList = await localDataSource.fetchReturnByRequests();

        return Right(returnList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnListByRequest = _getReturnListRequest(
        customerCode: customerCode.customerCodeSoldTo,
        salesOrg: salesOrg,
        shipToInfo: shipToInfo.shipToCustomerCode,
        user: user,
        pageSize: pageSize,
        offset: offset,
        appliedFilter: appliedFilter,
        searchKey: searchKey,
      );
      final returnList = await remoteDataSource.fetchReturnByRequest(
        requestParams:
            ReturnListRequestDto.fromDomain(returnListByRequest).toMap(),
      );

      return Right(returnList);
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
  Future<Either<ApiFailure, String>> getFileUrl({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Username username,
    required SalesOrg salesOrg,
    required bool isViewByReturn,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final fileUrl = await localDataSource.getFileUrl();

        return Right(fileUrl);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final fileUrl = await remoteDataSource.getFileUrl(
        soldTo: customerCodeInfo.customerCodeSoldTo,
        shipTo: shipToInfo.shipToCustomerCode,
        username: username.getOrCrash(),
        salesOrg: salesOrg.getOrCrash(),
        isViewByReturn: isViewByReturn,
      );

      return Right(fileUrl);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, File>> downloadFile({required String url}) async {
    try {
      final localFile = await remoteDataSource.downloadFile(
        url: url,
      );
      final downloadedFile = await fileSystemHelper.getDownloadedFile(
        localFile,
      );

      return Right(downloadedFile);
    } catch (e) {
      return const Left(ApiFailure.poorConnection());
    }
  }

  ReturnListRequest _getReturnListRequest({
    required String customerCode,
    required SalesOrg salesOrg,
    required String shipToInfo,
    required User user,
    required int pageSize,
    required int offset,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  }) =>
      ReturnListRequest.empty().copyWith(
        customerCode: customerCode,
        salesOrg: salesOrg,
        shipToInfo: shipToInfo,
        userName: user.username,
        after: offset,
        first: pageSize,
        filter: appliedFilter,
        searchKey: searchKey,
      );
}
