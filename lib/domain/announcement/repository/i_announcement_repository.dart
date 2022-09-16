import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAnnouncementRepository {
  Future<Either<ApiFailure, Announcement>> getAnnouncements();
}
