import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/returns_expansion_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

late final Uint8List imageUint8List;
final options = RequestOptions(
  responseType: ResponseType.json,
  path: '',
);

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockShipToCodeBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class MockBannerRepository extends Mock implements BannerRepository {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockUserRepo extends Mock implements UserRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late GetIt locator;
  final mockBannerBloc = MockBannerBloc();
  late AuthBloc mockAuthBloc;
  late MockHTTPService mockHTTPService;
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late ShipToCodeBloc mockShipToCodeBloc;
  late EligibilityBloc eligibilityBlocMock;
  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    enableOrderType: true,
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockAuthBloc = MockAuthBloc();
    mockSalesOrgBloc = MockSalesOrgBloc();
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator
        .registerLazySingleton(() => CountlyService(config: locator<Config>()));
    locator.registerLazySingleton(() => mockAuthBloc);
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockBannerBloc);
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    mockUserBloc = MockUserBloc();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockShipToCodeBloc = MockShipToCodeBloc();
    eligibilityBlocMock = EligibilityBlocMock();
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
      when(() => mockUserBloc.state).thenReturn(UserState.initial().copyWith(
        user: fakeUser,
      ));
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockShipToCodeBloc.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial().copyWith(
        user: fakeUser,
      ));
    });

    StackRouterScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => mockCustomerCodeBloc),
          BlocProvider<ShipToCodeBloc>(create: (context) => mockShipToCodeBloc),
          BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock),
        ],
        child: const Scaffold(
          body: ReturnsExpansionTile(),
        ),
      );
    }

    testWidgets(
      'Returns Features Visibility Test - Root admin',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('root_admin'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsOneWidget);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsOneWidget);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsOneWidget);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsOneWidget);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - Return admin',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('return_admin'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsOneWidget);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsOneWidget);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsOneWidget);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsOneWidget);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - ZP admin',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('zp_admin'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsOneWidget);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsNothing);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsOneWidget);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsOneWidget);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - Client admin',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('client_admin'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsNothing);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsNothing);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsNothing);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsNothing);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - ZP Admin Attachments',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('zp_admin_attachments'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsNothing);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsNothing);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsNothing);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsNothing);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - Client User',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsOneWidget);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsNothing);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsNothing);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsNothing);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - Internal Sales Rep',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsOneWidget);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsNothing);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsNothing);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsNothing);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - External Sales Rep',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('external_sales_rep'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsOneWidget);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsNothing);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsNothing);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsNothing);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - Return Requestor',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('return_requestor'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsOneWidget);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsNothing);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsNothing);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsNothing);
      },
    );

    testWidgets(
      'Returns Features Visibility Test - Return Approver',
      (tester) async {
        when(() => mockUserBloc.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('return_approver'),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        final overviewTile = find.byKey(const Key('overviewTile'));
        expect(overviewTile, findsNothing);

        final requestReturnTile = find.byKey(const Key('requestReturnTile'));
        expect(requestReturnTile, findsOneWidget);

        final approverActionsTile =
            find.byKey(const Key('approverActionsTile'));
        expect(approverActionsTile, findsOneWidget);

        final returnSummaryTile = find.byKey(const Key('returnSummaryTile'));
        expect(returnSummaryTile, findsOneWidget);

        final userRestrictionTile =
            find.byKey(const Key('userRestrictionTile'));
        expect(userRestrictionTile, findsNothing);

        final policyConfigurationTile =
            find.byKey(const Key('policyConfigurationTile'));
        expect(policyConfigurationTile, findsNothing);
      },
    );
  });
}
