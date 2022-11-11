import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/repository/announcement_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnouncementMockRepo extends Mock implements AnnouncementRepository {}

void main() {
  late AnnouncementRepository repository;
  late Announcement announcementMock;
  final announcementState = AnnouncementState.initial();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AnnouncementMockRepo();

    announcementMock = await AnnouncementLocalDataSource().getAnnouncements();
  });

  group('Announcement Bloc', () {
    blocTest(
      'Get announcement fail',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getAnnouncements()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AnnouncementBloc bloc) =>
          bloc..add(const AnnouncementEvent.getAnnouncement()),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          announcement: Announcement.empty(),
        ),
      ],
    );

    blocTest(
      'Get announcement success',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getAnnouncements()).thenAnswer(
          (invocation) async => Right(
            announcementMock,
          ),
        );
      },
      act: (AnnouncementBloc bloc) =>
          bloc..add(const AnnouncementEvent.getAnnouncement()),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          announcement: announcementMock,
        ),
      ],
      verify: (AnnouncementBloc bloc) => expect(
        bloc.state.announcement,
        announcementMock,
      ),
    );

    blocTest(
      'Get announcement success then close announcement',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getAnnouncements()).thenAnswer(
          (invocation) async => Right(
            announcementMock,
          ),
        );
      },
      act: (AnnouncementBloc bloc) => bloc
        ..add(const AnnouncementEvent.getAnnouncement())
        ..add(const AnnouncementEvent.close()),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          announcement: announcementMock,
        ),
        announcementState.copyWith(
          isClosed: true,
          announcement: Announcement.empty(),
        ),
      ],
      verify: (AnnouncementBloc bloc) => expect(
        announcementState.announcement,
        Announcement.empty(),
      ),
    );
  });
}
