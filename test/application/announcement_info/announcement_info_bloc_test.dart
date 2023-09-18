import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class AnnouncementInfoRepositoryRepo extends Mock
    implements AnnouncementInfoRepository {}

void main() {
  late AnnouncementInfoRepositoryRepo repository;
  late AnnouncementArticleInfo announcementInfoMock;
  final announcementInfoState = AnnouncementInfoState.initial();
  final salesOrg = SalesOrg('');
  late Config config;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AnnouncementInfoRepositoryRepo();
    config = Config()..appFlavor = Flavor.mock;
    announcementInfoMock =
        await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
  });

  group('Announcement Info Bloc', () {
    blocTest(
      'Get announcement info fail',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          AnnouncementInfoEvent.fetch(
            salesOrg: salesOrg,
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(isLoading: true),
        announcementInfoState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get announcement info Success',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementInfoMock,
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          AnnouncementInfoEvent.fetch(
            salesOrg: salesOrg,
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(isLoading: true),
        announcementInfoState.copyWith(
          announcementInfo: announcementInfoMock,
        ),
      ],
    );
    blocTest(
      'Get announcement info loadmore Success',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      seed: () => announcementInfoState.copyWith(
        announcementInfo: announcementInfoMock,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: announcementInfoMock.endCursor,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementInfoMock,
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          AnnouncementInfoEvent.loadMore(
            salesOrg: salesOrg,
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(
          isLoading: true,
          announcementInfo: announcementInfoMock,
          canLoadMore: true,
        ),
        announcementInfoState.copyWith(
          announcementInfo: announcementInfoMock.copyWith(
            announcementList: [
              ...announcementInfoMock.announcementList,
              ...announcementInfoMock.announcementList,
            ],
          ),
        ),
      ],
    );
    blocTest(
      'Get announcement info loadmore fail',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      seed: () => announcementInfoState.copyWith(
        announcementInfo: announcementInfoMock,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: announcementInfoMock.endCursor,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          AnnouncementInfoEvent.loadMore(
            salesOrg: salesOrg,
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(
          isLoading: true,
          announcementInfo: announcementInfoMock,
          canLoadMore: true,
        ),
        announcementInfoState.copyWith(
          announcementInfo: announcementInfoMock,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );
    blocTest(
      'Get announcement info updateSearchKey',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          const AnnouncementInfoEvent.updateSearchKey(
            searchKey: 'fake_searchKey',
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(
          searchKey: SearchKey.searchFilter('fake_searchKey'),
        ),
      ],
    );
  });
}
