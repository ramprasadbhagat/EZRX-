import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IpoAttachmentRepository {
  Future<Either<ApiFailure, List<File>>> downloadFiles({
    required List<PoDocuments> files,
    required AttachmentType attachmentType,
  });
  Future<Either<ApiFailure, OpenResult>> openFile({
    required PoDocuments files,
    required AttachmentType attachmentType,
  });
  Future<Either<ApiFailure, List<PoDocuments>>> uploadFiles({
    required List<PlatformFile> files,
  });

  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required UploadOptionType uploadOptionType,
  });

  Future<Either<ApiFailure, List<PlatformFile>>> pickFiles({
    required UploadOptionType uploadOptionType,
  });

  Future<Either<ApiFailure, PermissionStatus>> downloadPermission();
  Future<Either<ApiFailure, bool>> deleteFile({
    required String filePath,
  });
}
