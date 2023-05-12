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

import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/payments_expansion_tile.dart';
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
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
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

    RouteDataScope getWUT() {
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
          body: PaymentsExpansionTile(),
        ),
      );
    }

    testWidgets(
        'PaymentsExpansionTile should be displayed when isPaymentsAccessible is true',
        (WidgetTester tester) async {
      // Arrange
      //isPaymentsAccessible is true when User role is root_admin, zp_admin, client_admin, client_user
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('root_admin'),
            ),
          ),
        ),
      );
      // Act
      await tester.pumpWidget(
        getWUT(),
      );
      // Assert
      final orderExpansionTile = find.byKey(const Key('paymentsExpansionTile'));
      expect(orderExpansionTile, findsOneWidget);
    });
    testWidgets(
        'PaymentsExpansionTile should not be displayed when isPaymentsAccessible is false',
        (WidgetTester tester) async {
      // Arrange
      //isPaymentsAccessible is false when User role is not root_admin, zp_admin, client_admin, client_user
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
        ),
      );
      // Act
      await tester.pumpWidget(
        getWUT(),
      );
      // Assert
      final orderExpansionTile = find.byKey(const Key('paymentsExpansionTile'));
      expect(orderExpansionTile, findsNothing);
    });
  });
}
