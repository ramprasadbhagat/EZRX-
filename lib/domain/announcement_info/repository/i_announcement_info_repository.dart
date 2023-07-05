import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAnnouncementInfoRepository {
  Future<Either<ApiFailure, AnnouncementInfo>> getAnnouncement({
    required SalesOrg salesOrg,
    required int pageSize,
  });
}
