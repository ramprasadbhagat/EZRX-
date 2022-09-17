import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/banners/banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

late final Uint8List imageUint8List;
final options = RequestOptions(
  responseType: ResponseType.json,
  path: '',
);

class MockHTTPService extends Mock implements HttpService {}

void main() {
  late GetIt locator;
  late HttpService mockHTTPService;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => CountlyService());

    mockHTTPService = MockHTTPService();
    when(() => mockHTTPService.request(
          method: 'POST',
          url: '/api/downloadAttachment',
          data: {'url': 'mock-image-url'},
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
    setUp(() {});

    Widget getWUT(Config config) {
      return BannerTile(
        banner: BannerItem.empty().copyWith(
          url: 'mock-image-url',
          urlLink: 'mock-url-link',
        ),
        httpService: mockHTTPService,
        countlyService: locator<CountlyService>(),
        config: config,
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
  });
}
