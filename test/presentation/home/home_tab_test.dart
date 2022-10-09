import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

enum SalesOrgVariant { onn, off }

enum CustomerCodeVariant { onn, off }

enum ShipToCodeVariant { onn, off }

final salesOrgVariants = ValueVariant({...SalesOrgVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

final shipToCodeVariants = ValueVariant({...ShipToCodeVariant.values});

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final mockBannerBloc = MockBannerBloc();
  late MockHTTPService mockHTTPService;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late AppRouter autoRouterMock;
  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockBannerBloc);
    locator.registerLazySingleton(() => CountlyService());
    mockHTTPService = MockHTTPService();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });
  group('Home Tab Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
    });

    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en', 'SG'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en', 'SG'),
        fallbackLocale: const Locale('en', 'SG'),
        saveLocale: true,
        useOnlyLangCode: false,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBlocMock),
            BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
          ],
          child: const HomeTab(),
        ),
      );
    }

    testWidgets('Home Page Initialized', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final homeTileCard = find.byKey(const Key('HomeTileCard')).last;
      expect(homeTileCard, findsOneWidget);
      await tester.tap(homeTileCard);
      await tester.pump();
    });

    testWidgets(
      'Test Sales Org Selector tile',
      (tester) async {
        final expectedStates = [
          SalesOrgState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('FAKE-SALE-ORG'))),
        ];

        when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
            user: User.empty().copyWith(userSalesOrganisations: [
          SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('FAKE-ZPMG')),
          SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('FAKE-TW'))
        ])));

        whenListen(salesOrgBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final salesOrgSelectTile = find.byKey(const Key('salesOrgSelect')).last;
        await tester.tap(salesOrgSelectTile);
        await tester.pump();

        if (salesOrgVariants.currentValue == SalesOrgVariant.onn) {
          final salesOrgOption = find.byKey(const Key('salesOrgOptionFAKE-TW'));
          expect(salesOrgOption, findsOneWidget);
          await tester.tap(salesOrgOption);
          await tester.pump();
        }
        expect(find.text('Please select a Sales Org'.tr()), findsOneWidget);
      },
      variant: salesOrgVariants,
    );

    testWidgets(
      'Test Customer Code failed',
      (tester) async {
        final expectedStates = [
          CustomerCodeState.initial().copyWith(
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('Fake-error')))),
        ];
        whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        final customerCodeSelectTile =
            find.byKey(const Key('customerCodeSelect')).last;
        await tester.tap(customerCodeSelectTile);
        await tester.pump();
        final errorMessage = find.byKey(const Key('snackBarMessage'));
        expect(errorMessage, findsOneWidget);
      },
      variant: customerCodeVariants,
    );

    testWidgets(
      'Test Customer Code Selector tile',
      (tester) async {
        final expectedStates = [
          CustomerCodeState.initial().copyWith(
              customeCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-customer-code')),
        ];
        whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        final customerCodeSelectTile =
            find.byKey(const Key('customerCodeSelect')).last;
        await tester.tap(customerCodeSelectTile);
        await tester.pump();
      },
      variant: customerCodeVariants,
    );

    //TODO: Wasim fix this
    // testWidgets(
    //   'Test Ship To Code Selector tile',
    //   (tester) async {
    //     final expectedCustomerState = [
    //       CustomerCodeState.initial()
    //           .copyWith(isFetching: false, apiFailureOrSuccessOption: none())
    //     ];
    //     final expectedStates = [
    //       ShipToCodeState.initial().copyWith(
    //           shipToInfo: ShipToInfo.empty()
    //               .copyWith(shipToCustomerCode: 'fake-ship_to-code')),
    //     ];
    //     final expectedOnShipToSelectStates = [
    //       ShipToCodeState.initial().copyWith(
    //           shipToInfo: ShipToInfo.empty()
    //               .copyWith(shipToCustomerCode: 'fake-123456')),
    //     ];
    //     whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedStates));
    //     whenListen(customerCodeBlocMock, Stream.fromIterable(expectedCustomerState));
    //     whenListen(shipToCodeBlocMock,
    //         Stream.fromIterable(expectedOnShipToSelectStates));

    //     await tester.pumpWidget(getScopedWidget());
    //     whenListen(shipToCodeBlocMock,
    //         Stream.fromIterable(expectedOnShipToSelectStates));
    //     await tester.pump();
    //     final shipToCodeSelectTile =find.byKey(const Key('shipToCodeSelect')).last;
    //     await tester.tap(shipToCodeSelectTile);
    //     await tester.pump();

    //     if (shipToCodeVariants.currentValue == CustomerCodeVariant.onn) {
    //       final shipToCodeOption =
    //           find.byKey(const Key('shipToOptionfake-123456'));
    //       expect(shipToCodeOption, findsOneWidget);
    //       await tester.tap(shipToCodeOption);
    //       await tester.pump();
    //     }
    //     expect(
    //         find.text('Please select a shipping address'.tr()), findsOneWidget);
    //   },
    //   variant: shipToCodeVariants,
    // );
  });
}
