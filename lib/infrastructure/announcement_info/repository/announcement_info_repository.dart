

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_info_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';

class AnnouncementInfoRepository extends IAnnouncementInfoRepository{
  final AnnouncementInfoRemoteDataSource remoteDataSource;
  final AnnouncementInfoLocalDataSource localDataSource;
  final Config config;

  AnnouncementInfoRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, AnnouncementInfo>> getAnnouncement({
    required SalesOrg salesOrg,
    required int pageSize,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final announcementInfo = await localDataSource.getAnnouncementInfo();

        return Right(announcementInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final announcementInfo = await remoteDataSource.getAnnouncementInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        template: config.announcementTemplate,
        pageSize: pageSize,
        variablePath: salesOrg.announcementVariablePath,
        lang: salesOrg.locale.languageCode,
      );

      return Right(announcementInfo);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}