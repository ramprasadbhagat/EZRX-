import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';

abstract class IReturnRequestRepository {
  Future<Either<ApiFailure, ReturnMaterialList>> searchReturnMaterials({
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
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
}
