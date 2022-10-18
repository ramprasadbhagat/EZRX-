import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/banners/banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart' hide Config;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:file/local.dart';

import '../../../utils/widget_utils.dart';

late final Uint8List imageUint8List;
final options = RequestOptions(
  responseType: ResponseType.json,
  path: '',
);

class MockHTTPService extends Mock implements HttpService {}

class MockCacheManager extends Mock implements DefaultCacheManager {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  late GetIt locator;
  late HttpService mockHTTPService;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  const mockUrl = 'mock-image-urls';
  const mockUrlLink = 'www.google.com';
  final mockBanner = BannerItem.empty().copyWith(
    url: mockUrl,
    urlLink: mockUrlLink,
  );
  late DefaultCacheManager cacheManagerMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => CountlyService());

    mockHTTPService = MockHTTPService();
    cacheManagerMock = MockCacheManager();
    when(() => mockHTTPService.request(
          method: 'POST',
          url: '/api/downloadAttachment',
          data: {
            'url': mockUrl,
          },
          responseType: ResponseType.bytes,
        )).thenAnswer(
      (invocation) => Future.value(
        Response(
          statusCode: 200,
          data: imageUint8List,
          requestOptions: options,
        ),
      ),
    );
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );

    final imageData =
        await rootBundle.load('assets/images/data/banner_image_data');
    imageUint8List = imageData.buffer
        .asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);
  });

  group('Banner Tile', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      authBlocMock = AuthBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    });

    Widget getWUT(Config config) {
      return BannerTile(
        banner: mockBanner,
        httpService: mockHTTPService,
        countlyService: locator<CountlyService>(),
        config: config,
        defaultCacheManager: cacheManagerMock,
      );
    }

    StackRouterScope getScopedWidget(Config config) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        ],
        child: getWUT(config),
      );
    }

    testWidgets('Banner test 1 - Mock Flavour', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.mock;
      await tester.pumpWidget(getWUT(config));
      await tester.pump();

      final bannerTile = find.byType(BannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
    });

    testWidgets('Banner test 2 - Non Mock Flavour', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.uat;
      await tester.pumpWidget(getWUT(config));
      await tester.pump();

      final bannerTile = find.byType(BannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
    });

    testWidgets('Banner test 3 - Have mock cache file', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.uat;
      const fileSystem = LocalFileSystem();

      when(
        () => cacheManagerMock.getFileFromCache(mockUrl),
      ).thenAnswer(
        (invocation) async {
          final fileInfo = FileInfo(
            fileSystem.file(
                './assets/images/ezrxlogo.png'), // Return your image file path
            FileSource.Cache,
            DateTime(2050),
            mockUrl,
          );

          return fileInfo;
        },
      );

      final wut = getScopedWidget(config);

      await tester.pumpWidget(wut);
      await tester.pump();

      final bannerTile = find.byType(BannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
      final gestD = find.byType(GestureDetector);
      expect(
        gestD,
        findsOneWidget,
      );
      final gestDOffset = tester.getCenter(gestD);
      await tester.tapAt(gestDOffset);
    });

    testWidgets('Banner test 4 - Mock cache file returns NULL', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.mock;

      when(
        () => cacheManagerMock.getFileFromCache(mockUrl),
      ).thenAnswer(
        (invocation) async {
          return null;
        },
      );

      await tester.pumpWidget(getWUT(config));
      await tester.pump();

      final bannerTile = find.byType(BannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
    });

    testWidgets('Banner test 4 - Mock cache file when flavor is mock',
        (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.uat;

      when(
        () => cacheManagerMock.getFileFromCache(mockUrl),
      ).thenAnswer(
        (invocation) async {
          return null;
        },
      );

      await tester.pumpWidget(getWUT(config));
      await tester.pump();

      final bannerTile = find.byType(BannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
    });
  });
}
