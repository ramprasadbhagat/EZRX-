import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/repository/i_admin_po_attachment_repository.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/admin_po_attachment_filter_dto.dart';

class AdminPoAttachmentRepository implements IAdminPoAttachmentRepository {
  final Config config;
  final AdminPoAttachmentLocalDataSource localDataSource;
  final AdminPoAttachmentRemoteDataSource remoteDataSource;

  AdminPoAttachmentRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<AdminPoAttachment>>> getAdminPoAttachment({
    required int pageSize,
    required int offset,
    required AdminPoAttachmentFilter adminPoAttachmentFilter,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final poAttachments = await localDataSource.getAdminPoAttachment();

        return Right(poAttachments);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final poAttachments = await remoteDataSource.getAdminPoAttachment(
        pageSize: pageSize,
        offset: offset,
        filterQuery:
            AdminPoAttachmentFilterDto.fromDomain(adminPoAttachmentFilter)
                .toJson(),
      );

      return Right(poAttachments);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
