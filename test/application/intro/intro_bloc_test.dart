import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

void main() {
  final deviceRepositoryMock = DeviceRepositoryMock();

  group('Intro Bloc', () {
    blocTest(
      'Initialize',
      build: () => IntroBloc(deviceRepository: deviceRepositoryMock),
      act: (IntroBloc bloc) => bloc.add(const IntroEvent.initialIndex()),
      expect: () => [IntroState.initial()],
    );

    blocTest(
      'Index Change',
      build: () => IntroBloc(deviceRepository: deviceRepositoryMock),
      act: (IntroBloc bloc) => bloc.add(const IntroEvent.setIndex(index: 2)),
      expect: () => [
        IntroState.initial().copyWith(
          index: 2,
        ),
      ],
    );

    blocTest(
      'Check first launch success',
      build: () => IntroBloc(deviceRepository: deviceRepositoryMock),
      act: (IntroBloc bloc) => bloc.add(const IntroEvent.checkAppFirstLaunch()),
      setUp: () {
        when(() => deviceRepositoryMock.getDeviceData()).thenAnswer(
          (invocation) async => const Right(false),
        );
      },
      expect: () => [
        IntroState.initial().copyWith(
          isAppFirstLaunch: false,
        ),
      ],
    );

    blocTest(
      'Check first launch fail',
      build: () => IntroBloc(deviceRepository: deviceRepositoryMock),
      act: (IntroBloc bloc) => bloc.add(const IntroEvent.checkAppFirstLaunch()),
      setUp: () {
        when(() => deviceRepositoryMock.getDeviceData()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Cache failed')),
        );
      },
      expect: () => [
        IntroState.initial().copyWith(
          isAppFirstLaunch: true,
        ),
      ],
    );

    blocTest(
      'Set app first launch success',
      build: () => IntroBloc(deviceRepository: deviceRepositoryMock),
      act: (IntroBloc bloc) => bloc.add(const IntroEvent.setAppFirstLaunch()),
      setUp: () {
        when(() => deviceRepositoryMock.setDeviceData(isAppFirstLaunch: false))
            .thenAnswer(
          (invocation) async => Future(() => const Right(unit)),
        );
      },
      expect: () => [
        IntroState.initial().copyWith(
          isAppFirstLaunch: false,
        ),
      ],
    );

    blocTest(
      'Set app launch fail',
      build: () => IntroBloc(deviceRepository: deviceRepositoryMock),
      act: (IntroBloc bloc) => bloc.add(const IntroEvent.setAppFirstLaunch()),
      setUp: () {
        when(() => deviceRepositoryMock.setDeviceData(isAppFirstLaunch: false))
            .thenAnswer(
          (invocation) async =>
              Future(() => const Left(ApiFailure.other('Cache failed'))),
        );
      },
      expect: () => [
        IntroState.initial().copyWith(
          isAppFirstLaunch: false,
        ),
      ],
    );
  });
}
