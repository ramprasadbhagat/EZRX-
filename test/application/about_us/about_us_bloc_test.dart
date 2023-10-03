import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_local.dart';
import 'package:ezrxmobile/infrastructure/about_us/repository/about_us_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AboutUsRepositoryRepo extends Mock implements AboutUsRepository {}

void main() {
  late AboutUsRepositoryRepo repository;
  late AboutUs aboutUs;
  final aboutUsState = AboutUsState.initial();
  final salesOrg = SalesOrg('');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AboutUsRepositoryRepo();
    aboutUs = await AboutUsLocalDataSource().getAboutUs();
  });

  group('About Us Bloc', () {
    blocTest(
      'Initialized',
      build: () => AboutUsBloc(
        repository: repository,
      ),
      act: (AboutUsBloc bloc) => bloc.add(const AboutUsEvent.initialize()),
      expect: () => [aboutUsState],
    );
    blocTest(
      'Get about us fail',
      build: () => AboutUsBloc(
        repository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAboutUsInfo(
            salesOrg: salesOrg,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AboutUsBloc bloc) => bloc
        ..add(
          AboutUsEvent.fetchAboutUsInfo(
            salesOrg: salesOrg,
          ),
        ),
      expect: () => [
        aboutUsState.copyWith(isFetching: true),
        aboutUsState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get about us Success',
      build: () => AboutUsBloc(
        repository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAboutUsInfo(
            salesOrg: salesOrg,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            aboutUs,
          ),
        );
      },
      act: (AboutUsBloc bloc) => bloc
        ..add(
          AboutUsEvent.fetchAboutUsInfo(
            salesOrg: salesOrg,
          ),
        ),
      expect: () => [
        aboutUsState.copyWith(isFetching: true),
        aboutUsState.copyWith(
          aboutUsInfo: aboutUs,
        ),
      ],
    );
  });
}
