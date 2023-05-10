import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAdminPoAttachmentRepository {
  Future<Either<ApiFailure, List<AdminPoAttachment>>> getAdminPoAttachment({
    required int pageSize,
    required int offset,
    required AdminPoAttachmentFilter adminPoAttachmentFilter,
  });
}
