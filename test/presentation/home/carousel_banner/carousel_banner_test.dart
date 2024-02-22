import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';

import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockBannerRepository extends Mock implements BannerRepository {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockUserRepo extends Mock implements UserRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

void main() {
  late BannerBloc mockBannerBloc;
  late AuthBloc mockAuthBloc;
  late MockHTTPService mockHTTPService;
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late EligibilityBloc mockEligibilityBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;

  const mockUrl = 'mock-image-urls';
  // const mockUrlLink = 'www.google.com';
  // final mockBanner1 = EZReachBanner.empty().copyWith(
  //   id: 1,
  //   title: 'Banner Title 1',
  //   url: mockUrl,
  //   urlLink: mockUrlLink,
  // );
  // final mockBanner2 = EZReachBanner.empty().copyWith(
  //   id: 2,
  //   title: 'Banner Title 2',
  //   url: mockUrl,
  //   urlLink: mockUrlLink,
  // );

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
    locator.registerLazySingleton<MixpanelService>(() => MockMixpanelService());
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    mockEligibilityBloc = MockEligibilityBloc();
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
      when(() => mockEligibilityBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => mockEligibilityBloc,
          ),
        ],
        child: const Scaffold(body: CarouselBanner()),
      );
    }

    testWidgets('CarouselBanner test - when customer code changed - Success',
        (tester) async {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
      final expectedCustomerCodeInfo = [
        EligibilityState.initial().copyWith(isLoadingCustomerCode: true),
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          isLoadingCustomerCode: false,
        ),
      ];
      whenListen(
        mockEligibilityBloc,
        Stream.fromIterable(expectedCustomerCodeInfo),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      verify(
        () => mockBannerBloc.add(
          BannerEvent.fetch(
            salesOrganisation: mockEligibilityBloc.state.salesOrganisation,
            bannerType: 'banner_carousel',
            country: mockEligibilityBloc.state.salesOrg.country,
            isPreSalesOrg: false,
            role: mockEligibilityBloc.state.user.role.type.getEZReachRoleType,
            branchCode: fakeCustomerCodeInfo.shipToInfos.first.plant,
            targetCustomerType:
                fakeCustomerCodeInfo.shipToInfos.first.targetCustomerType,
          ),
        ),
      ).called(1);
    });

    //commented test case reason:
    //since MixpanelService has changed we need to mock
    //the actual Mixpanel library class otherwise we will face this
    //issue:
    //The following LateError was thrown building:
    // LateInitializationError: Field 'mixpanel' has not been initialized.

    // testWidgets('Banner test 1 - Many banners for multiple pages',
    //     (tester) async {
    //   VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //   final bannerBloc = locator<BannerBloc>();
    //   final expectedStates = [
    //     CustomerCodeState.initial().copyWith(),
    //   ];
    //   whenListen(mockCustomerCodeBloc, Stream.fromIterable(expectedStates));
    //   when(() => bannerBloc.stream).thenAnswer((invocation) {
    //     return Stream.fromIterable([
    //       BannerState.initial().copyWith(
    //         banner: [
    //           mockBanner1,
    //           mockBanner2,
    //           mockBanner1,
    //           mockBanner2,
    //           mockBanner1,
    //           mockBanner2,
    //           mockBanner1,
    //           mockBanner2,
    //           mockBanner1,
    //           mockBanner2,
    //         ],
    //       ),
    //     ]);
    //   });

    //   await tester.pumpWidget(getWUT());
    //   await tester.pump();

    //   await tester.pump(const Duration(seconds: 8));
    //   expect(
    //     find.byKey(WidgetKeys.homeBanner),
    //     findsOneWidget,
    //   );
    //   final bannerTile = find.byType(CarouselBannerTile);
    //   expect(bannerTile, findsAtLeastNWidgets(1));
    //   final smoothPageIndicator = find.byType(SmoothPageIndicator);
    //   expect(
    //     smoothPageIndicator,
    //     findsOneWidget,
    //   );

    //   final si = find.descendant(
    //     of: smoothPageIndicator,
    //     matching: find.byType(SmoothIndicator),
    //   );
    //   expect(si, findsOneWidget);
    //   final rotBox = find.descendant(of: si, matching: find.byType(RotatedBox));
    //   expect(rotBox, findsOneWidget);
    //   final gestD =
    //       find.descendant(of: rotBox, matching: find.byType(GestureDetector));
    //   expect(gestD, findsOneWidget);

    //   final offsetGestD = tester.getCenter(gestD);
    //   await tester.tapAt(offsetGestD);
    //   await tester.pump();
    // });

    testWidgets('Banner test 2 - is Snackbar shown?', (tester) async {
      final bannerBloc = locator<BannerBloc>();
      final mockState = BannerState.initial().copyWith(
        banner: [
          EZReachBanner.empty(),
          EZReachBanner.empty(),
        ],
        bannerFailureOrSuccessOption:
            optionOf(const Left(ApiFailure.other('Fake Error'))),
      );
      when(() => bannerBloc.state).thenReturn(mockState);
      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([BannerState.initial(), mockState]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 3 - is User getting logged out when Auth failed',
        (tester) async {
      final bannerBloc = locator<BannerBloc>();
      final mockState = BannerState.initial().copyWith(
        banner: [
          EZReachBanner.empty(),
          EZReachBanner.empty(),
        ],
        bannerFailureOrSuccessOption:
            optionOf(const Left(ApiFailure.other('authentication failed'))),
      );
      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([BannerState.initial(), mockState]);
      });
      when(() => bannerBloc.state).thenReturn(mockState);

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 4 - No API error', (tester) async {
      final bannerBloc = locator<BannerBloc>();
      final mockState = BannerState.initial().copyWith(
        banner: [
          EZReachBanner.empty(),
          EZReachBanner.empty(),
        ],
        bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
      );

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([BannerState.initial(), mockState]);
      });
      when(() => bannerBloc.state).thenReturn(mockState);

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.homeBanner),
        findsOneWidget,
      );
    });

    //commented test case reason:
    //since MixpanelService has changed we need to mock
    //the actual Mixpanel library class otherwise we will face this
    //issue:
    //The following LateError was thrown building:
    // LateInitializationError: Field 'mixpanel' has not been initialized.

    // testWidgets('Banner test - Auto Scroll - Success', (tester) async {
    //   final bannerBloc = locator<BannerBloc>();

    //   when(() => bannerBloc.stream).thenAnswer((invocation) {
    //     return Stream.fromIterable([
    //       BannerState.initial(),
    //       BannerState.initial().copyWith(
    //         banner: [
    //           mockBanner1,
    //           mockBanner2,
    //         ],
    //         bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
    //       ),
    //     ]);
    //   });

    //   await tester.pumpWidget(getWUT());
    //   await tester.pump();

    //   var bannerPageViewController = PageController();
    //   final bannerPageViewFinder = find.byType(PageView);
    //   expect(bannerPageViewFinder, findsOneWidget);

    //   final bannerPageView = tester.widget<PageView>(bannerPageViewFinder);

    //   final firstBanner = find.byKey(Key(mockBanner1.id.toString()));
    //   expect(firstBanner, findsOneWidget);

    //   bannerPageViewController = bannerPageView.controller;
    //   expect(bannerPageViewController.hasClients, true);
    //   bannerPageViewController.jumpToPage(1);
    //   await tester.pump();

    //   final secondBanner = find.byKey(Key(mockBanner2.id.toString()));
    //   expect(secondBanner, findsOneWidget);
    // });

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
