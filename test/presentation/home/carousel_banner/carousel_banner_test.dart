import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';

import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockBannerRepository extends Mock implements BannerRepository {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockUserRepo extends Mock implements UserRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late BannerBloc mockBannerBloc;
  late AuthBloc mockAuthBloc;
  late MockHTTPService mockHTTPService;
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;

  const mockUrl = 'mock-image-urls';
  const mockUrlLink = 'www.google.com';
  final mockBanner1 = BannerItem.empty().copyWith(
    id: 1,
    title: 'Banner Title 1',
    url: mockUrl,
    urlLink: mockUrlLink,
  );
  final mockBanner2 = BannerItem.empty().copyWith(
    id: 2,
    title: 'Banner Title 2',
    url: mockUrl,
    urlLink: mockUrlLink,
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockAuthBloc = MockAuthBloc();
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockBannerBloc = MockBannerBloc();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockAuthBloc);
    locator.registerFactory(() => mockBannerBloc);
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    mockUserBloc = MockUserBloc();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );

    final imageData =
        await rootBundle.load('assets/images/data/banner_image_data');
    final imageUint8List = imageData.buffer
        .asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);

    final options = RequestOptions(
      responseType: ResponseType.json,
      path: '',
    );
    when(
      () => mockHTTPService.request(
        method: 'GET',
        url: mockUrl,
        responseType: ResponseType.bytes,
      ),
    ).thenAnswer(
      (invocation) => Future.value(
        Response(
          statusCode: 200,
          data: imageUint8List,
          requestOptions: options,
        ),
      ),
    );
  });
  final fakeCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '00001234');

  group('Carousel Banner', () {
    setUp(() {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
        ],
        child: const Scaffold(body: CarouselBanner()),
      );
    }

    testWidgets('CarouselBanner test - when customer code changed - Success',
        (tester) async {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
      final bannerBloc = locator<BannerBloc>();

      final expectedCustomerCodeInfo = [
        CustomerCodeState.initial()
            .copyWith(customerCodeInfo: fakeCustomerCodeInfo),
        CustomerCodeState.initial(),
      ];
      whenListen(
        mockCustomerCodeBloc,
        Stream.fromIterable(expectedCustomerCodeInfo),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump(const Duration(seconds: 2));
      verify(
        () => bannerBloc.add(
          BannerEvent.fetch(
            salesOrganisation: mockSalesOrgBloc.state.salesOrganisation,
            bannerType: 'banner_carousel',
            country: mockSalesOrgBloc.state.salesOrg.country,
            isPreSalesOrg: false,
            role: mockUserBloc.state.user.role.type.getEZReachRoleType,
          ),
        ),
      ).called(2);
    });
    testWidgets('Banner test 1 - Many banners for multiple pages',
        (tester) async {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
      final bannerBloc = locator<BannerBloc>();
      final expectedStates = [
        CustomerCodeState.initial().copyWith(),
      ];
      whenListen(mockCustomerCodeBloc, Stream.fromIterable(expectedStates));
      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial().copyWith(
            banner: [
              mockBanner1,
              mockBanner2,
              mockBanner1,
              mockBanner2,
              mockBanner1,
              mockBanner2,
              mockBanner1,
              mockBanner2,
              mockBanner1,
              mockBanner2,
            ],
          ),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 8));
      expect(
        find.byKey(WidgetKeys.homeBanner),
        findsOneWidget,
      );
      final bannerTile = find.byType(CarouselBannerTile);
      expect(bannerTile, findsAtLeastNWidgets(1));
      final smoothPageIndicator = find.byType(SmoothPageIndicator);
      expect(
        smoothPageIndicator,
        findsOneWidget,
      );

      final si = find.descendant(
        of: smoothPageIndicator,
        matching: find.byType(SmoothIndicator),
      );
      expect(si, findsOneWidget);
      final rotBox = find.descendant(of: si, matching: find.byType(RotatedBox));
      expect(rotBox, findsOneWidget);
      final gestD =
          find.descendant(of: rotBox, matching: find.byType(GestureDetector));
      expect(gestD, findsOneWidget);

      final offsetGestD = tester.getCenter(gestD);
      await tester.tapAt(offsetGestD);
      await tester.pump();
    });

    testWidgets('Banner test 2 - is Snackbar shown?', (tester) async {
      final bannerBloc = locator<BannerBloc>();

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
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 3 - is User getting logged out when Auth failed',
        (tester) async {
      final bannerBloc = locator<BannerBloc>();

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
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 4 - No API error', (tester) async {
      final bannerBloc = locator<BannerBloc>();

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
        find.byKey(WidgetKeys.homeBanner),
        findsOneWidget,
      );
    });

    testWidgets('Banner test - Auto Scroll - Success', (tester) async {
      final bannerBloc = locator<BannerBloc>();

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial(),
          BannerState.initial().copyWith(
            banner: [
              mockBanner1,
              mockBanner2,
            ],
            bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
          ),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      var bannerPageViewController = PageController();
      final bannerPageViewFinder = find.byType(PageView);
      expect(bannerPageViewFinder, findsOneWidget);

      final bannerPageView = tester.widget<PageView>(bannerPageViewFinder);

      final firstBanner = find.byKey(Key(mockBanner1.id.toString()));
      expect(firstBanner, findsOneWidget);

      bannerPageViewController = bannerPageView.controller;
      expect(bannerPageViewController.hasClients, true);
      bannerPageViewController.jumpToPage(1);
      await tester.pump();

      final secondBanner = find.byKey(Key(mockBanner2.id.toString()));
      expect(secondBanner, findsOneWidget);
    });

    testWidgets('Empty Banner test - Auto Scroll', (tester) async {
      final bannerBloc = locator<BannerBloc>();

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial(),
          BannerState.initial().copyWith(
            banner: [],
            bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
          ),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      var bannerPageViewController = PageController();
      final bannerPageViewFinder = find.byType(PageView);

      try {
        final bannerPageView = tester.widget<PageView>(bannerPageViewFinder);
        expect(bannerPageViewFinder, findsOneWidget);
        bannerPageViewController = bannerPageView.controller;
      } catch (e) {
        expect(bannerPageViewFinder, findsNothing);
        expect(bannerPageViewController.hasClients, false);
      }
    });
  });
}
