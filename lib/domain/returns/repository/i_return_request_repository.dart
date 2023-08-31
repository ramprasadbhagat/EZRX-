import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_materials_params.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';

abstract class IReturnRequestRepository {
  Future<Either<ApiFailure, ReturnMaterialList>> searchReturnMaterials({
    required ReturnMaterialsParams requestParams,
  });

  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required UploadOptionType uploadOptionType,
  });

  Future<Either<ApiFailure, List<PlatformFile>>> pickFiles({
    required UploadOptionType uploadOptionType,
  });

  Future<Either<ApiFailure, List<ReturnRequestAttachment>>> uploadFiles({
    required String assignmentNumber,
    required List<PlatformFile> files,
  });

  Future<Either<ApiFailure, bool>> deleteFile({
    required String filePath,
  });

  Future<Either<ApiFailure, File>> downloadFile({
    required ReturnRequestAttachment file,
  });

  Future<Either<ApiFailure, PermissionStatus>> getDownloadPermission();

  Future<Either<ApiFailure, String>> addRequest({
    required AddRequestParams requestParams,
  });
}
