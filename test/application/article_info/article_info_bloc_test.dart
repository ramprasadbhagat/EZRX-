import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';
import 'package:ezrxmobile/infrastructure/article_info/repository/article_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class ArticleInfoRepo extends Mock implements ArticleInfoRepository {}

void main() {
  late ArticleInfoRepo repository;
  late AnnouncementArticleInfo articleInfoMock;
  final articlesInfoState = ArticlesInfoState.initial();
  final salesOrg = SalesOrg('');
  late Config config;
  final user = User.empty().copyWith(
    username: Username('fake-name'),
    role: Role(
      description: 'fake-desc',
      id: 'id',
      name: 'fake-name',
      type: RoleType('fake-type'),
    ),
    preferredLanguage: const Locale(ApiLanguageCode.english),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ArticleInfoRepo();
    config = Config()..appFlavor = Flavor.mock;
    articleInfoMock = await ArticleInfoLocalDataSource().getArticles();
  });

  group('Articles Info Bloc', () {
    blocTest(
      'Get Articles info fail',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
            user: user,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc
        ..add(
          ArticlesInfoEvent.getArticles(
            salesOrg: salesOrg,
            user: user,
          ),
        ),
      expect: () => [
        articlesInfoState.copyWith(isFetching: true),
        articlesInfoState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get Articles info Success',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
            user: user,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            articleInfoMock,
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc
        ..add(
          ArticlesInfoEvent.getArticles(
            salesOrg: salesOrg,
            user: user,
          ),
        ),
      expect: () => [
        articlesInfoState.copyWith(isFetching: true),
        articlesInfoState.copyWith(
          articleInfo: articleInfoMock,
          apiFailureOrSuccessOption: optionOf(Right(articleInfoMock)),
        ),
      ],
    );

    blocTest(
      'Get Articles info loadmore Success',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => articlesInfoState.copyWith(
        articleInfo: articleInfoMock,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: articleInfoMock.endCursor,
            user: user,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            articleInfoMock,
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc
        ..add(
          ArticlesInfoEvent.loadMoreArticles(
            salesOrg: salesOrg,
            user: user,
          ),
        ),
      expect: () => [
        articlesInfoState.copyWith(
          isFetching: true,
          articleInfo: articleInfoMock,
          canLoadMore: true,
        ),
        articlesInfoState.copyWith(
          articleInfo: articleInfoMock.copyWith(
            announcementList: [
              ...articleInfoMock.announcementList,
              ...articleInfoMock.announcementList
            ],
          ),
          canLoadMore: false,
          apiFailureOrSuccessOption: optionOf(Right(articleInfoMock)),
        ),
      ],
    );

    blocTest(
      'Get Articles info loadmore fail',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => articlesInfoState.copyWith(
        articleInfo: articleInfoMock,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: articleInfoMock.endCursor,
            user: user,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc
        ..add(
          ArticlesInfoEvent.loadMoreArticles(
            salesOrg: salesOrg,
            user: user,
          ),
        ),
      expect: () => [
        articlesInfoState.copyWith(
          isFetching: true,
          articleInfo: articleInfoMock,
          canLoadMore: true,
        ),
        articlesInfoState.copyWith(
          articleInfo: articleInfoMock,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'Get Articles info setSearchKey',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      act: (ArticlesInfoBloc bloc) => bloc
        ..add(
          const ArticlesInfoEvent.setSearchKey(
            searchKey: 'fake_searchKey',
          ),
        ),
      expect: () => [
        articlesInfoState.copyWith(
          searchKey: SearchKey.searchFilter('fake_searchKey'),
        ),
      ],
    );
  });
}
