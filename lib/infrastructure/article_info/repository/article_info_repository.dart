import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_remote.dart';

import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';

import 'package:ezrxmobile/domain/article_info/repository/i_article_info_repository.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

class ArticleInfoRepository extends IArticleInfoRepository {
  final ArticleInfoRemoteDataSource remoteDataSource;
  final ArticleInfoLocalDataSource localDataSource;
  final Config config;

  ArticleInfoRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, AnnouncementArticleInfo>> getArticles({
    required SalesOrg salesOrg,
    required User user,
    required int pageSize,
    required String after,
  }) async {
    final preferredLanguage = user.settings.languagePreference.getOrCrash();

    if (config.appFlavor == Flavor.mock) {
      try {
        final announcementInfo = await localDataSource.getArticles();

        return Right(announcementInfo);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final announcementInfo = await remoteDataSource.getArticleInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        template: config.articleTemplate,
        pageSize: pageSize,
        variablePath: salesOrg.articleVariablePath,
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
