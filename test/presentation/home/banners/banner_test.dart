import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:ezrxmobile/presentation/home/banners/banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockBannerRepository extends Mock implements BannerRepository {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockUserRepo extends Mock implements UserRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late GetIt locator;
  final mockBannerBloc = MockBannerBloc();
  late AuthBloc mockAuthBloc;
  late MockHTTPService mockHTTPService;
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;

  final mockSalesOrg = SalesOrg('mock-salesOrg');
  final salesOrg2601 = SalesOrg('2601');
  final mockSalesOrganisation = SalesOrganisation(
      salesOrg: mockSalesOrg, customerInfos: <CustomerInfo>[]);
  final salesOrganisation2601 = SalesOrganisation(
      salesOrg: salesOrg2601, customerInfos: <CustomerInfo>[]);

  late final mockBannerItem;

  late final Uint8List imageUint8List;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockAuthBloc = MockAuthBloc();
    mockSalesOrgBloc = MockSalesOrgBloc();
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => CountlyService());
    locator.registerLazySingleton(() => mockAuthBloc);
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockBannerBloc);
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    when(() => mockHTTPService.request(
          method: 'POST',
          url: '/api/downloadAttachment',
        )).thenAnswer((invocation) {
      var options = RequestOptions(
        responseType: ResponseType.json,
        path: '',
      );
      return Future.value(
        Response(
          statusCode: 200,
          data: imageUint8List,
          requestOptions: options,
        ),
      );
    });
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );

    final imageData =
        await rootBundle.load('assets/images/data/banner_image_data');
    imageUint8List = imageData.buffer
        .asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);
  });

  group('Home Banner', () {
    setUp(() {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
    });

    StackRouterScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
        ],
        child: Scaffold(body: HomeBanner()),
      );
    }

    testWidgets('Banner test 1', (tester) async {
      final bannerBloc = locator<MockBannerBloc>();

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial(),
          BannerState.initial().copyWith(banner: [BannerItem.empty()]),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(const Key('homeBanner')),
        findsOneWidget,
      );
      final bannerTile = find.byType(BannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
    });

    testWidgets('Banner test 2 - is Snackbar shown?', (tester) async {
      final bannerBloc = locator<MockBannerBloc>();

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial(),
          BannerState.initial().copyWith(
            banner: [
              BannerItem.empty(),
              BannerItem.empty(),
            ],
            bannerFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake Error'))),
          ),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(const Key('snackBarMessage')),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 3 - is User getting logged out when Auth failed',
        (tester) async {
      final bannerBloc = locator<MockBannerBloc>();

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial(),
          BannerState.initial().copyWith(
            banner: [
              BannerItem.empty(),
              BannerItem.empty(),
            ],
            bannerFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('authentication failed'))),
          ),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(const Key('snackBarMessage')),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 4 - No API error', (tester) async {
      final bannerBloc = locator<MockBannerBloc>();

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial(),
          BannerState.initial().copyWith(
            banner: [
              BannerItem.empty(),
              BannerItem.empty(),
            ],
            bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
          ),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(const Key('homeBanner')),
        findsOneWidget,
      );
    });

  });
}
