import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/domain/faq/repository/i_faq_repositoty.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_remote.dart';

class FAQInfoRepository extends IFAQInfoRepository {
  final FAQInfoRemoteDataSource remoteDataSource;
  final FAQInfoLocalDataSource localDataSource;
  final Config config;

  FAQInfoRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, FAQInfo>> getFAQList({
    required SalesOrg salesOrg,
    required User user,
    required int pageSize,
    required String after,
  }) async {
    final preferredLanguage = user.preferredLanguage;

    if (config.appFlavor == Flavor.mock) {
      try {
        final faqInfo = await localDataSource.getFAQInfo();

        return Right(faqInfo);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final announcementInfo = await remoteDataSource.getFAQInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        template: config.faqTemplate,
        pageSize: pageSize,
        variablePath: salesOrg.faqVariablePath,
        lang: preferredLanguage,
        after: after,
      );

      return Right(announcementInfo);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
