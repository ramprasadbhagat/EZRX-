import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/material_frame_wrapper.dart';

class BannerBlocMock extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class BannerMock extends Mock implements HomeBanner {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

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

  group('Home Banner', () {
    setUp(() {
      bannerBlocMock = BannerBlocMock();

      when(() => bannerBlocMock.state).thenReturn(BannerState.initial());
    });

    testWidgets('Banner test 1', (tester) async {
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<BannerBloc>(
            create: (context) => bannerBlocMock,
            child: HomeBanner(),
          ),
        ),
      );

      // Create the Finders.
      final pageViewForHomeBanner = find.byKey(const Key('homeBanner'));

      expect(pageViewForHomeBanner, findsOneWidget);
    });
  });
}
