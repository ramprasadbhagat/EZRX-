import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class BannerBlocMock extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

void main() {
  late GetIt locator;
  late BannerBlocMock bannerBlocMock;

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(
      () => CountlyService(),
    );
    locator.registerLazySingleton<HttpService>(
      () => HttpService(
        config: locator<Config>(),
        interceptors: [],
      ),
    );
  });

  // group('Login Form Bloc', () {
  //   blocTest<BannerBloc, BannerState>(
  //     'Create Banner bloc',
  //     build: () => BannerBloc(
  //         bannerRepository: bannerRepository, salesOrgBloc: salesOrgBloc),
  //     setUp: () {
  //       when(() => authRepoMock.loadCredential()).thenAnswer(
  //         (invocation) async => const Left(
  //           ApiFailure.other('fake-error'),
  //         ),
  //       );
  //     },
  //     expect: () => [],
  //   );
  // });
}
