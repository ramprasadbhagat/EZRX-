import 'dart:async';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement/repository/i_announcement_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';

class AnnouncementRepository implements IAnnouncementRepository {
  final AnnouncementRemoteDataSource remoteDataSource;
  final AnnouncementLocalDataSource localDataSource;
  final Config config;

  AnnouncementRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, Announcement>> getAnnouncements() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final announcement = await localDataSource.getAnnouncements();

        return Right(announcement);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final annoucement = await remoteDataSource.getAnnouncements();

      return Right(annoucement);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
